sqlite3 resource search
=======================

This implements a Resource Search plugin for [bel.rb](http://github.com/OpenBEL/bel.rb) backed by a [Sqlite3](http://sqlite.org/) database. The database utilizes Sqlite's FTS tables to provide full-text query over BEL Resource concepts.

Features
--------

- Plugs in to bel.rb as a Resource Search API implementation.
- Efficient full-text searching.

System Requirement
------------------

- SQLite 3

Todo
----

- Implement sqlite3 database creation as an executable. Currently code to build the sqlite3 FTS database exists at [rdf-misc](https://github.com/OpenBEL/rdf-misc).

How can I use this?
------------------

bel.rb provides an [approach to plugins](https://github.com/OpenBEL/bel.rb/wiki/Plugins-in-bel.rb) that is meant to be uncomplicated. The following steps will get you started:

- Build gem with `gem build .gemspec` and install with `gem install bel-search-sqlite-1.0.0.gem`.
- On JRuby, build gem with `gem build .gemspec-java` and install with `gem install bel-search-sqlite-1.0.0-java.gem`.
- Now you have this plugin installed and ready for use in bel.rb!
- With bel.rb installed run the command `bel plugins` to list available plugins.

```bash
$ bin/bel plugins
Resource Search plugins
-----------------------

 Name:        Resource search on sqlite FTS
 Description: A resource search implementation using sqlite FTS capabilities.
```

- To create the search implementation in Ruby try:

```ruby
search_plugin = BEL::Resource::Search.plugins[:sqlite]

search_plugin.create_search(:database_file => 'resources.db')
```

- Enjoy FTS goodness with Sqlite!

## Development

### branches

- master branch
  - Contains stable code. Releases are created from this branch using a tag (e.g. `MAJOR.MINOR.PATCH`).

- next branch
  - Contains unstable code. Commits should be merged into master after it stabilizes.

### releases

Releases of *bel-search-sqlite* should follow these steps:

1. Update the version in the `VERSION` file.

2. Add changes for this version to the `CHANGELOG` file. This file is modelled after http://keepachangelog.com/.

3. Push the changes for `VERSION` and `CHANGELOG` on the master branch.

4. Ensure the *master* branch has all of the required changes.

5. Create a git tag, named after the version, on the *master* branch. Push this tag to GitHub.

6. Create the Ruby and Java RubyGem for *bel-search-sqlite*.

  `gem build .gemspec`

  `gem build .gemspec-java`

7. Create a release on GitHub for this version and attach the gem files.

8. Push gems to RubyGems.

  `gem push bel-search-sqlite-VERSION.gem`

  `gem push bel-search-sqlite-VERSION-java.gem`

