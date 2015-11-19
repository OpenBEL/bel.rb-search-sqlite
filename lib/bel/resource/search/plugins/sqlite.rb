require 'bel'

module BEL::Resource::Search::Plugins

  module Sqlite

    extend BEL::Resource::Search::ClassMethods

    NAME        = 'Resource search on sqlite FTS'
    DESCRIPTION = 'A resource search implementation using sqlite FTS capabilities.'

    # @see BEL::Resource::Search::ClassMethods#create_search
    def self.create_search(options = {})
      require_relative 'sqlite/sqlite3'
      Sqlite3FTS.new(options)
    end

    def self.name
      NAME
    end

    def self.description
      DESCRIPTION
    end
  end
end
