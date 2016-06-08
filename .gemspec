Gem::Specification.new do |spec|
  spec.name                     = 'bel-search-sqlite'
  spec.version                  = '1.0.0'
  spec.summary                  = '''
                                    Resource search plugin for bel.rb using Sqlite FTS.
                                  '''.gsub(%r{^\s+}, ' ').gsub(%r{\n}, '')
  spec.description              = '''
                                    A resource search plugin for bel.rb that uses FTS tables in
                                    Sqlite to search annotation and namespace values. Built to
                                    run on MRI to take advantage of C extensions.
                                  '''.gsub(%r{^\s+}, ' ').gsub(%r{\n}, '')
  spec.license                  = 'Apache-2.0'
  spec.authors                  = [
                                    'Anthony Bargnesi',
                                  ]
  spec.email                    = [
                                    'abargnesi@selventa.com',
                                  ]
  spec.files                    = [
                                    Dir.glob('lib/**/*.{rb,erb}'),
                                    __FILE__,
                                    'CHANGELOG.md',
                                    'LICENSE',
                                    'INSTALL.md',
                                    'README.md',
                                  ].flatten!
  spec.executables              = Dir.glob('bin/*').map(&File.method(:basename))
  spec.homepage                 = 'https://github.com/OpenBEL/bel.rb-search-plugin'
  spec.rdoc_options             = [
                                    '--title', 'BEL Resource Search - Sqlite',
                                    '--main', 'README.md',
                                    '--line-numbers',
                                    'CHANGELOG.md',
                                    'LICENSE',
                                    'INSTALL.md',
                                    'README.md',
                                  ]

  spec.platform                 = 'ruby'
  spec.required_ruby_version    = '>= 2.0.0'
  spec.add_runtime_dependency     'bel',     '~> 1.0.0'
  spec.add_runtime_dependency     'sequel',  '4.28.0'
  spec.add_runtime_dependency     'sqlite3', '1.3.11'
  spec.post_install_message     = %Q{
******************************
*  bel-search-sqlite plugin  *
******************************
Thank you for installing the bel-search-sqlite plugin to bel.rb.

This plugin is built to run on Ruby and uses sqlite3 + C
extensions to access a SQLite database for full-text search of
annotation and namespace values.

To verify the bel-search-sqlite plugin can be used by bel.rb
execute the bel.rb command:

    bel plugins --list

To access this within bel.rb execute the following ruby code:

    require 'bel'
    search_plugin = BEL::Resource::Search.plugins[:sqlite]
    search_plugin.create_search(
      :database => 'resources.db'
    )

}
end
# vim: ft=ruby ts=2 sw=2:
# encoding: utf-8
