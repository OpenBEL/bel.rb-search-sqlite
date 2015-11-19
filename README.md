sqlite3 resource search
=======================

This implements a Resource Search plugin for [bel.rb](http://github.com/OpenBEL/bel.rb) backed by a [Sqlite3](http://sqlite.org/) database. The database utilizes Sqlite's FTS tables to provide full-text query over BEL Resource concepts.

Features
--------

- Plugs in to bel.rb as a Resource Search API implementation.
- Efficient full-text searching.

Todo
----

- Implement sqlite3 database creation as an executable. Currently code to build the sqlite3 FTS database exists at [rdf-misc](https://github.com/OpenBEL/rdf-misc).

How can I use this?
------------------

bel.rb provides an [approach to plugins](https://github.com/OpenBEL/bel.rb/wiki/Plugins-in-bel.rb) that is meant to be uncomplicated. The following steps will get you started:

- Install gem with `gem build bel-search-sqlite.gemspec` followed by `gem install bel-search-sqlite-1.0.0.gem`.
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

search_plugin.create_search(:database => 'resources.db')
```

- Enjoy FTS goodness with Sqlite!
