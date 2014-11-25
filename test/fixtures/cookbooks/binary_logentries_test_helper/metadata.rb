# -*- encoding : utf-8 -*-
name             'logentries_ng_test_helper'
maintainer       "Konstantin Lysenko"
maintainer_email "gshaud@gmail.com"
license          'MIT'
description      'Cookbook for testing logentries_ng LWRP'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

recipe 'default', 'calls logentries_ng LWRP for testing purposes'

%w{ debian }.each do |os|
  supports os
end

depends 'logentries_ng'
