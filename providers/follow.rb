include Chef::DSL::IncludeRecipe

def whyrun_supported?
  true
end

use_inline_resources

action :add do
  service 'logentries' do
    supports [:start, :stop, :restart, :reload]
    action :nothing
    only_if { ::File.exist?('/etc/init.d/logentries') }
  end

  script = ["le follow", %Q("#{new_resource.log_file}")]
  script.push %Q(--type "#{new_resource.log_type}") if new_resource.log_type

  execute "logentries follow #{new_resource.name}" do
    user new_resource.user
    command script.flatten.join ' '
    not_if %Q(sudo le followed "#{new_resource.log_file}")
    notifies :restart, 'service[logentries]'
  end
end
