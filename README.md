# rspikes 

[![Join the chat at https://gitter.im/eendroroy/rspikes](https://badges.gitter.im/eendroroy/rspikes.svg)](https://gitter.im/eendroroy/rspikes?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Gem Version](https://badge.fury.io/rb/rspikes.svg)](https://rubygems.org/gems/rspikes) 
[![Downloads](https://img.shields.io/gem/dt/rspikes.svg)](https://rubygems.org/gems/rspikes)
[![Build Status](https://travis-ci.org/eendroroy/rspikes.svg?branch=master)](https://travis-ci.org/eendroroy/rspikes)
[![Code Climate](https://codeclimate.com/github/eendroroy/rspikes/badges/gpa.svg)](https://codeclimate.com/github/eendroroy/rspikes)
[![codecov](https://codecov.io/gh/eendroroy/rspikes/branch/master/graph/badge.svg)](https://codecov.io/gh/eendroroy/rspikes)


A tool to display bar-chart anywhere.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspikes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspikes

## Usage

in irb

    irb(main):001:0> require 'rspikes'
    irb(main):002:0> Rspikes.spike([1,2,3,4,5,6])
    irb(main):003:0> Rspikes.spike([1,2,3,4,5,6], rows=2)
    
in commandline

    $ spike 1 2 3 4 5 6
    $ spike -l 3  1 2 3 4 5 6
    
read from stdin

    $ spike
    > 2 4 3 7 2 9
    > # press Ctrl-D
    ▂▄▃▆▂█

#### use with git
commit count per day:
    
    $ git log | grep Date | awk '{print " : "$4" "$3" "$6}' | uniq -c | awk '{print $1}' | spike
    
    ▁▄▅▁▁▂▁▁▂▄▄▇▃█▁▁▁▁▁▁▁

commit count per author
    
    $ git log | grep Author | awk '{print $NF}' | sort | uniq -c | awk '{print $1}' | spike -l4
    
    █
    █
    █  ▁
    █▅▁█▅▂▆▄█


## Development

After checking out the repo, run `bin/setup` to install dependencies. 
Then, run `rake spec` to run the tests. 
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. 
To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`,
which will create a git tag for the version, push git commits and tags, 
and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [rspikes repository](https://github.com/eendroroy/rspikes). 
This project is intended to be a safe, welcoming space for collaboration,
and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

