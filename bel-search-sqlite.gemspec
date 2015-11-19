Gem::Specification.new do |spec|
  spec.name                     = 'bel-search-sqlite'
  spec.version                  = '1.0.0'
  spec.summary                  = '''
                                    Resource search plugin for bel.rb using Sqlite FTS.
                                  '''.gsub(%r{^\s+}, ' ').gsub(%r{\n}, '')
  spec.description              = '''
                                    A resource search plugin for bel.rb that uses FTS tables in
                                    Sqlite to search annotation and namespace values.
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

  spec.required_ruby_version    = '>= 2.0.0'
  spec.add_runtime_dependency     'sqlite3', '~> 1.3'
end
# vim: ts=2 sw=2:
# encoding: utf-8
