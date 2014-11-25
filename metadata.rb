name             "logentries_ng"
maintainer       "Konstantin Lysenko"
maintainer_email "gshaud@gmail.com"
license          "MIT"
description      "LWRP for Installing and managing Logentries."
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version          "0.2.1"

depends "apt"
depends "yum"

%w{ubuntu debian amazon}.each do |os|
  supports os
end

provides "logentries_ng"
