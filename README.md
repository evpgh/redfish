# Redfish

Redfish is a Ruby gem that provides [describe what your gem does in a sentence or two].

## Installation

To install Redfish, add the following line to your application's Gemfile:

```ruby
gem 'redfish'
```

Then execute:
```bash
$ bundle install
```

Or install it yourself as:
```bash
$ gem install redfish
```

## Usage

The `rf` command line tool provides several options for managing your Redfish site:

### Create a New Site

To create a new site, use the `-n` or `--new` option followed by the name of your project:

```bash
rf --new PROJECT_NAME
```

This will generate a new Redfish project with the specified name.

### Build the Site

To build your site, use the `-b` or `--build` option:

```bash
rf --build
```

This will build your site and place the output in the `build` directory.

### Watch for Changes

To watch for changes and automatically rebuild your site when a change is detected, use the `-w` or `--watch` option:

```bash
rf --watch
```

### Create a New Component

To create a new component, use the `-c` or `--new-component` option followed by the name of your component:

```bash
rf --new-component COMPONENT_NAME
```

This will generate a new component with the specified name.

### Help

To print usage information, use the `-h` or `--help` option:

```bash
rf --help
```

This will print a help message with information about all available options.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/evpgh/redfish.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
