logentries_ng_test_helper cookbook
============================

This a cookbook for testing logentries_ng cookbook LWRP

Requirements
------------

### OS

* Debian 7

Attributes
----------

Usage
-----
#### logentries_ng_test_helper::default

Include `logentries_ng_test_helper` in your test-kitchen .kitchen.yml like:

```
suites:
- name: server
  run_list:
  - recipe[logentries_ng_test_helper]
```

# Author

Author:: Lysenko Konstantin (<gshaud@gmail.com>)
