### Depreciated

I never got around to actually finishing this project.  With the rise of filesystems that support snapshotting and deduplication this project has become less relavant for me.  I'd suggest using obnam or ZFS as alternatives to rdiff-backup workflows.

# rdiff-simple

[![Gem Version](https://badge.fury.io/rb/rdiff-simple.png)](http://badge.fury.io/rb/rdiff-simple)
[![Build Status](https://travis-ci.org/ketiko/rdiff-simple.png?branch=master)](https://travis-ci.org/ketiko/rdiff-simple)
[![Dependency Status](https://gemnasium.com/ketiko/rdiff-simple.png)](https://gemnasium.com/ketiko/rdiff-simple)
[![Code Climate](https://codeclimate.com/github/ketiko/rdiff-simple.png)](https://codeclimate.com/github/ketiko/rdiff-simple)
[![Coverage Status](https://coveralls.io/repos/ketiko/rdiff-simple/badge.png)](https://coveralls.io/r/ketiko/rdiff-simple)

A simple wrapper around rdiff-backup

* [Source Code](http://github.com/ketiko/rdiff-simple)
* [API documentation](http://rubydoc.info/github/ketiko/rdiff-simple/master)
* [Rubygem](http://rubygems.org/gems/rdiff-simple)

## Installation

```bash
$ gem install rdiff-simple
```

## Usage

In your file:

```ruby
  require 'rdiff_simple'

  rdiff = RdiffSimple::RdiffBackup.new
  rdiff.backup('/source', '/destination', :print_statistics, exclude: '/source/private')
  rdiff.verify('/destination')
```

## License

Released under the MIT License.  See the [LICENSE][] file for further details.

[license]: LICENSE.txt
