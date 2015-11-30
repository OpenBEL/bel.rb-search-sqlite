require 'bel'

module BEL::Resource::Search::Plugins

  module Sqlite

    extend BEL::Resource::Search::ClassMethods

    NAME        = 'Resource search on sqlite FTS'
    DESCRIPTION = 'A resource search implementation using sqlite FTS capabilities.'

    # @see BEL::Resource::Search::ClassMethods#create_search
    def self.create_search(options = {})
      database_file = options[:database_file]
      unless database_file
        raise ArgumentError.new(':database_file option must be provided')
      end

      # database abstraction
      require 'sequel'
      # Resource search implementation
      require_relative 'sqlite/sqlite3'

      case RUBY_ENGINE
      when "jruby"
        require 'jdbc/sqlite3'
        Sqlite3FTS.new(Sequel.connect("jdbc:sqlite:#{database_file}"))
      when "ruby", "rbx"
        require 'sqlite3'
        Sqlite3FTS.new(Sequel.connect("sqlite://#{database_file}"))
      else
        raise RuntimeError.new("Unsupported ruby engine: #{RUBY_ENGINE}")
      end
    end

    def self.name
      NAME
    end

    def self.description
      DESCRIPTION
    end
  end
end
