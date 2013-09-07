require "bundler/update_stdout/version"

module Bundler
  module UpdateStdout
    class Base
      def self.update_stdout
        puts 'bundle-update_stdout'
      end
    end
  end
end
