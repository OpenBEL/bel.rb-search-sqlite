# Change Log
All notable changes to bel-search-sqlite will be documented in this file. The curated log begins at changes to version 0.4.0.

This project adheres to [Semantic Versioning](http://semver.org/).

## [0.4.2][0.4.2] - 2015-12-17
### Added
- Added the :exclude_identifier_schemes option to search for concepts where their preferred label is not an identifier. This was added to allows more human-friendly biological identifiers to be returned.
- Allow [bel.rb][bel.rb] gem dependency within version range 0.4.x < 0.5 (pessimistic version qualifier).

## [0.4.1][0.4.1] - 2015-12-17
### Note
- Yanked this version. Dependency on bel.rb was incorrect.

## 0.4.0 - 2015-12-14
### Added
- Added full-text-search of annotations and namespaces using SQLite. This implementation provides a solution for CRuby and JRuby using the wonderful "sequel" gem.

[0.4.2]:    https://github.com/OpenBEL/bel.rb-search-sqlite/compare/0.4.0...0.4.2
