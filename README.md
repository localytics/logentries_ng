# logentries_ng

## Description

LWRP for logentries

## Requirements

### Supported Platforms

The following platforms are supported by this cookbook, meaning that the recipes run on these platforms without error:

* Ubuntu
* Debian
* Amazon Linux

## Usage
Look in fixtures cookbook for usage examples

## Notes

Logentries is split into two packages, `logentries` and `logentries-daemon`, the former contains the command-line tools and the latter is the reporting agent. Unfortunately, when you install the `logentries-daemon` package it immediately tries to start the agent and will fail if you haven't pre-configured your host settings; this is problematic in a Chef script, because we haven't had an opportunity to set things up yet.

To solve this problem, the commandline tools are installed immediately, then the `logentries-daemon` package will only be installed at the end of your chef run; it will be triggered by the use of any of the `logentries` definitions.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

**logentries_ng**

* Freely distributable and licensed under the MIT license.
* Copyright (c) 2014 Konstantin Lysenko (gshaud@gmail.com)
* Copyright (c) 2012 James Gregory (james@jagregory.com)
* http://www.jagregory.com
* [@jagregory](http://twitter.com/jagregory)
