require "bundler/update_stdout/version"
require 'bundler/cli'

# OVERRIDE
module Bundler
  class Definition
    def lock(file)
      contents = to_lock

      # Convert to \r\n if the existing lock has them
      # i.e., Windows with `git config core.autocrlf=true`
      contents.gsub!(/\n/, "\r\n") if @lockfile_contents.match("\r\n")

      return if @lockfile_contents == contents

      $stdout.write(contents)
    end
  end
end

module Bundler
  class CLI
    desc "update_stdout", "update the current environment into stdout"
    long_desc <<-D
      Update will install the newest versions of the gems listed in the Gemfile. Use
      update when you have changed the Gemfile, or if you want to get the newest
      possible versions of the gems in the bundle.
    D
    method_option "source", :type => :array, :banner => "Update a specific source (and all gems associated with it)"
    method_option "local", :type => :boolean, :banner =>
      "Do not attempt to fetch gems remotely and use the gem cache instead"
    # OVERRIDE
    method_option "quiet", :type => :boolean, :default => true, :banner =>
      "Only output warnings and errors."
    method_option "full-index", :type => :boolean, :banner =>
        "Use the rubygems modern index instead of the API endpoint"
    def update_stdout(*gems)
      update(*gems)
    end
  end
end
