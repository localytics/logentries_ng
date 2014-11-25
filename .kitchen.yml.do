---
driver:
  name: digitalocean
  region: sgp1
  size: 512mb

provisioner:
  name: chef_solo

platforms:
  - name: debian-7-0-x64

suites:
- name: default
  run_list:
    - recipe[logentries_ng_test_helper]
  attributes:
    logentries:
      account_key: <%= ENV['LOGENTRIES_API_KEY'] %>
