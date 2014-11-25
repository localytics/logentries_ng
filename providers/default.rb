include Chef::DSL::IncludeRecipe

def whyrun_supported?
  true
end

use_inline_resources

def common_options
  common = []
  common.push "--account-key #{new_resource.account_key}" if new_resource.account_key
  common.push "--host-key #{new_resource.host_key}" if new_resource.host_key
  common.push "--force" if new_resource.force
  common.push "--ec2eu" if new_resource.ec2eu
  common.push "--suppress-ssl" if new_resource.suppress_ssl
  common.push "--yes" if new_resource.yes
  common.push "--no-timestamps" if new_resource.no_timestamps
  common
end

action :clean do
  execute "logentries clean" do
    user new_resource.user
    command 'le clean'
  end
end

# need to ensure that register is done
action :rm do
  execute "logentries rm #{new_resource.entity}" do
    user new_resource.user
    command %Q(le rm "#{new_resource.entity}")
  end
end

action :install do
  include_recipe 'apt'

  case node['platform']
    when "ubuntu"
      apt_repository 'logentries' do
        uri 'http://rep.logentries.com/'
        components ['precise', 'main']
        keyserver 'hkp://pgp.mit.edu:80'
        key 'C43C79AD'
      end
    when "debian"
      apt_repository 'logentries' do
        uri 'http://rep.logentries.com/'
        components ['wheezy', 'main']
        keyserver 'pgp.mit.edu'
        key 'C43C79AD'
      end
      package "python-setproctitle"
    when "amazon"
      cookbook_file "logentries.repo" do
        source "logentries.repo"
        path "/etc/yum.repos.d/logentries.repo"
        owner "root"
        group "root"
        mode 0644
        action :create_if_missing
      end
  end

  package 'logentries'
end

action :install_and_register do
  logentries_ng 'Install logentries client' do
    action :install
  end

  logentries_ng 'Register host on logentries' do
    server_name new_resource.server_name
    account_key new_resource.account_key
    action :register
  end
end

# need to restart logentries
action :register do
  package 'logentries-daemon' do
    action :nothing
  end

  service 'logentries' do
    supports [:start, :stop, :restart, :reload]
    action :nothing
    only_if { ::File.exist?('/etc/init.d/logentries') }
  end

  script = ["le register", common_options]
  script.push %Q(--name "#{new_resource.server_name}") if new_resource.server_name
  script.push %Q(--hostname "#{new_resource.hostname}") if new_resource.hostname

  execute "logentries register" do
    user new_resource.user
    command script.flatten.join ' '
    not_if "grep -qE '^agent-key = .+$' /etc/le/config" unless new_resource.force
    notifies :install, 'package[logentries-daemon]', :immediate
    notifies :start, 'service[logentries]'
  end
end

action :unregister do
  logentries_ng 'Unregister host on logentries' do
    entity "hosts/#{new_resource.server_name}"
    action :rm
  end if new_resource.server_name
end

alias_method :action_remove, :action_rm
