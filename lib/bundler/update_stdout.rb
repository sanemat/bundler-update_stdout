require "bundler/update_stdout/version"
require 'bundler/cli'

module Bundler
  class CLI
    desc "update_stdout", "update the current environment into stdout"
    long_desc <<-D
      Update will install the newest versions of the gems listed in the Gemfile. Use
      update when you have changed the Gemfile, or if you want to get the newest
      possible versions of the gems in the bundle.
    D
    def update_stdout(*gems)
      puts 'bundle-update_stdout'
    end
  end
end
