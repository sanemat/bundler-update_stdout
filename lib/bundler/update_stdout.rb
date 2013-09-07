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
    def update_stdout(*gems)

      sources = Array(options[:source])
      # OVERRIDE
      Bundler.ui.level = "warn"

      if gems.empty? && sources.empty?
        # We're doing a full update
        Bundler.definition(true)
      else
        # cycle through the requested gems, just to make sure they exist
        names = Bundler.locked_gems.specs.map{ |s| s.name }
        gems.each do |g|
          next if names.include?(g)
          raise GemNotFound, not_found_message(g, names)
        end
        Bundler.definition(:gems => gems, :sources => sources)
      end

      Bundler::Fetcher.disable_endpoint = options["full-index"]

      opts = {"update" => true, "local" => options[:local]}
      # rubygems plugins sometimes hook into the gem install process
      Gem.load_env_plugins if Gem.respond_to?(:load_env_plugins)

      Bundler.definition.validate_ruby!
      Installer.install Bundler.root, Bundler.definition, opts
      Bundler.load.cache if Bundler.root.join("vendor/cache").exist?
      clean if Bundler.settings[:clean] && Bundler.settings[:path]
      Bundler.ui.confirm "Your bundle is updated!"
      Bundler.ui.confirm without_groups_message if Bundler.settings.without.any?
    end
  end
end
