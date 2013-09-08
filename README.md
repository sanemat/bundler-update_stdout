# Bundler::UpdateStdout

This provides `bundle-update_stdout update_stdout`, this is not actual update, but this can easily compare with old one!

## Installation

Add this line to your application's Gemfile:

    gem 'bundler-update_stdout'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bundler-update_stdout

## Usage

    $ bundle-update_stdout update_stdout

memo:
    In the future, I want to provide this as `bundle update --stdout`.

Then standard out shows below:

```text
PATH
  remote: .
  specs:
    mami (1.0.0)
      thor

GEM
  remote: https://rubygems.org/   
  specs:
    coderay (1.0.9)
    colorize (0.5.8)
    coveralls (0.6.7)
      colorize
      multi_json (~> 1.3)
      rest-client
      simplecov (>= 0.7)
      thor
    diff-lcs (1.2.4)
    method_source (0.8.2)
    mime-types (1.25)
    multi_json (1.7.9)
    pry (0.9.12.2)
      coderay (~> 1.0.5)
      method_source (~> 0.8)
      slop (~> 3.4)
    rake (10.1.0)
    rest-client (1.6.7)
      mime-types (>= 1.16)
    rspec (2.14.1)
      rspec-core (~> 2.14.0)
      rspec-expectations (~> 2.14.0)
      rspec-mocks (~> 2.14.0)
    rspec-core (2.14.5)
    rspec-expectations (2.14.2)   
      diff-lcs (>= 1.1.3, < 2.0)  
    rspec-mocks (2.14.3)
    simplecov (0.7.1)
      multi_json (~> 1.0)
      simplecov-html (~> 0.7.1)   
    simplecov-html (0.7.1)
    slop (3.4.6)
    thor (0.18.1)

PLATFORMS
  ruby

DEPENDENCIES
  bundler (~> 1.3)
  coveralls
  mami!
  pry
  rake
  rspec
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
