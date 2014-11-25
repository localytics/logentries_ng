# Create proof directory
directory '/tmp/serverspec'

logentries_ng 'Install logentries client' do
  action :install
end

logentries_ng 'Register host on logentries' do
  server_name node['fqdn']
  account_key node['logentries']['account_key']
  action :register
end

logentries_ng_follow 'Add a log to follow' do
  log_file '/var/log/syslog'
end

# Test for - no log duplication
logentries_ng_follow 'Add a log to follow' do
  log_file '/var/log/syslog'
end

# Test for - no log duplication
logentries_ng_follow 'Add a log to follow' do
  log_file '/var/log/syslog'
end

# Save proof of following log on logentries
execute 'Save proof that logentries works' do
  command 'le whoami > /tmp/serverspec/logentries.whoami' 
end

# Unregister logentries
logentries_ng 'Unregister host on logentries' do
  server_name node['fqdn']
  action :unregister
end
