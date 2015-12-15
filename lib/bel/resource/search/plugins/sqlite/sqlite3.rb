require 'bel'
require 'erb'
require 'pathname'
require 'sequel'

module BEL::Resource::Search::Plugins
  module Sqlite

    class Sqlite3FTS
      include BEL::Resource::Search
      include BEL::Resource::Search::API

      QUERY_TEMPLATE = ERB.new(
        File.read(Pathname(File.dirname(__FILE__)) + 'sqlite3_template.erb'),
        nil,
        '>'
      )
      PREPARED_STATEMENTS = {}

      def initialize(db)
        @db = db
      end

      # @see BEL::Resource::Search::API#search
      def search(query_expression, concept_type = nil, scheme_uri = nil, species = nil, options = {})
        # required SQL parameters
        size  = options.delete(:size) || -1
        if size.to_i.zero?
          fail ArgumentError.new(":size is zero")
        end

        # optional SQL parameters
        params = {
          :match                      => query_expression.encode('UTF-8'),
          :start                      => (options.delete(:start) || 0).to_i,
          :size                       => size,
          :concept_type               => (concept_type ? concept_type.to_s.encode('UTF-8') : nil),
          :scheme_uri                 => (scheme_uri ? scheme_uri.to_s.encode('UTF-8') : nil),
          :species                    => (species ? species.to_s.encode('UTF-8') : nil),
          :exclude_identifier_schemes => options.delete(:exclude_identifier_schemes)
        }

        query   = QUERY_TEMPLATE.result(binding)
        enum    = @db.fetch(query, params)

        if enum.respond_to? :lazy
          enum = enum.lazy
        end

        enum.map { |row|
          row_hash = row.to_hash
          row_hash[:alt_labels] = (row_hash[:alt_labels] || '').split('|')
          SearchResult.new(row_hash)
        }
      end
    end
  end
end
