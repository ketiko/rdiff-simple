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

## Quick Start

In your file:

```ruby
  require 'rdiff_simple'

  backup = RdiffSimple::RdiffBackup.new
  backup.execute('/source', '/destination', :print_statistics, exclude: '/source/private')
```

## Usage

Arguments Order is:

- `source`
- `destination`
- `flag options like --exclude-other-filesystems`
- `hash arguments like --exclude /usr/bin`

All multi-word symbols should be converted to underscores: `--exclude-other-filesystems` becomes `:exclude_other_filesystems`.

The `execute` method will return the exit code from rdiff-backup.  In order to get the output from rdiff-backup pass in a [`Logger`][logger] to [`RdiffBackup.new`][new].

## License

Released under the MIT License.  See the [LICENSE][] file for further details.

[license]: LICENSE.txt
[logger]: http://www.ruby-doc.org/stdlib-2.0.0/libdoc/logger/rdoc/Logger.html
[new]: http://rubydoc.info/github/ketiko/rdiff-simple/master/RdiffSimple/RdiffBackup#initialize-instance_method
