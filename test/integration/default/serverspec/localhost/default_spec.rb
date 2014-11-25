require 'spec_helper'

describe 'logentries_ng cookbook LWRP' do
  it 'action :install -> installs logentries agent' do
    expect(command('le --help').stdout).to match /Logentries agent version \d\.\d\.\d/
  end

  it 'action :register -> registers logentries agent' do
    expect(file('/tmp/serverspec/logentries.whoami').content).to match /key\ =\ \w*-\w*-\w*-\w*-\w*/
  end

  it 'action :follow -> follows /var/log/syslog' do
    expect(file('/tmp/serverspec/logentries.whoami').content).to match /syslog/
  end

  it 'action :follow -> doesn\'t create log duplicates' do
    expect(file('/tmp/serverspec/logentries.whoami').content.scan(/syslog/).size).to eq(1)
  end
  
  it 'action :unregister -> unregister logentries agent' do
    expect(command('le whoami').exit_status).not_to eq 0
  end

end
