# Capistrano for Lazy

This is a set of Capistrano 3.x tasks for some trivial processes.

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-lazy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-lazy

## Usage

### Rbenv and Ruby build tasks

I added a couple of tasks to manage rbenv and ruby-build remote setup, update and rubies installation.

```ruby
require 'capistrano/rbenv/lazy'
```

There are 3 new tasks and 3 new config directives:

  * `rbenv:setup` - installs rbenv remotely
  * `rbenv:update` - updates the rbenv installation
  * `rbenv:install[RUBY_VERSION]` - installs a ruby, in case you want to upgrade the ruby version

  * `ruby_build_path` - this will use ruby build to manage rubies installation, this option is where it should be installed, defaults to `$RBENV_PATH/plugins/ruby-build`
  * `rbenv_git_url` - the git url to use for setup, defaults to https://github.com/sstephenson/rbenv
  * `ruby_build_git_url` - the git url to use for installing ruby-build, defaults to https://github.com/sstephenson/ruby-build

## Contributing

1. Fork it ( http://github.com/stas/capistrano-lazy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
