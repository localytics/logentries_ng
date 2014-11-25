* Fix: duplication of servers
* Fix: rescue error 'host not found', in case of that error recipe should do le clean and le register. add check that disk is registered that will check that for 3 seconds and then fail.
* Add: check for debian 7 version
* Add: check for succesful registering (use command: 'le whoami'). in case of unsuccesful registering pring diagnostic message.
* Add: installation of logentries with bash script for unsupported distros.
* Add: restart logentries only when its necessary, remove mandatory restart in the end of recipe run
* Re-factor: split the logentries to several subresources
* Add guards for mandatory attributes
  See:
  # Chef::Application.fatal!("Missing logentries server_name.") unless node['logentries']['server_name']
  # Chef::Application.fatal!("Missing logentries account_key.") unless node['logentries']['account_key']
  # Chef::Application.fatal!("Expected hash of name => path for logentries log_files.") unless log_files.is_a? Hash

* Add: check for wrong logentries API key
* Add: check for wrong hostname in :unregister action
* Add: logentries-ng to the chef.supermarket
* Add: integration test for installing logentries client
* Add: unit test that check for executing logentries commands and check logentries service states after that
* Modify: Replace logentries restart on following command to service logentries force-reload
* Add :init, :reinit, :pull and :push actions
* Add following logs only if file with log exist. In other case print diagnostic message.
* Add: using log aliases
* Add: clear unregister. now after unregister you cannot register host again.
* Add: enhance follow with :set, :remove and :clean actions
action :set do
# Check: do we follow logs that not in logs array?
# if yes:
  # remove all followed logs
  # follow all logs in log array
# if no:
  # Find difference between log array and followed logs
  # Check do we have duplicated logs?
  # if yes:
    # remove all followed logs
    # follow all logs in log array
  # if no:
    # Check: does difference == 0?
    # if yes:
      # exit
    # if no:
      # follow logs those are in log array and not in followed logs 
end

action :remove do
  # Check do we follow that log?
  # if yes:
  # stop following it.
  # if no:
  # exit
end

action :clean do
  # remove all logs
end

alias_method :action_remove_all, :action_clean
