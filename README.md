# rdf-mongo :: MongoDB storage adapter for RDF.rb

This is an [RDF.rb][] storage adapter for MongoDB.

See <http://blog.datagraph.org/2010/04/rdf-repository-howto> for an overview of the general approach of creating RDF::Repository adaptors.

[![Gem Version](https://badge.fury.io/rb/rdf-mongo.png)](http://badge.fury.io/rb/rdf-mongo)
[![Build Status](https://travis-ci.org/ruby-rdf/rdf-mongo.png?branch=master)](http://travis-ci.org/ruby-rdf/rdf-mongo)

## Versioning and backwards compatibility

Moving forward, the versioning will reflect the [RDF.rb][] version number for which all rdf-specs are passing.

It should also be noted that prior to 1.0, there are no guarantees of backwards compatibility for data stored using previous versions of the gem.  This is to make optimizing the schema for MongoDB easy.

## Requirements

You'll need the 'mongo', 'rdf', 'rdf-spec', and 'rspec' libraries.  The easiest way to install these is via RubyGems.

    $ sudo gem install mongo rdf rdf-spec rspec rdf-mongo

## Implementation Notes

RDF Statements are stored as individual documents within MONGO using the following BSON:

    {
      "s":  RDF::Value
      "st": one of :u or :n
      "p":  RDF::URI
      "pt": must be :n
      "o"   RDF::Value
      "ot"  one of :u, :n, :l, :ll, or :lt
      "ol"  Language symbol or RDF::URI
      "c"   RDF::Value or false
      "ct": one of :u, :n, :l, :ll, :lt or :default
    }

An alternative that may be examined at a later point would be to use a representation based on RDF/JSON,
or JSON-LD. This would save documents based on a common subject with 
one more more predicates having one or more types.

### Support

Please post questions or feedback to the [W3C-ruby-rdf mailing list][].

### Authors
 * [Pius Uzamere][] | <http://github.com/pius> | <http://pius.me>
 * [Gregg Kellogg][] | <http://github.com/gkellogg> | <http://greggkellogg.net>

### Thank you

* Ben Lavender (author of the adapter skeleton) | <blavender@gmail.com> | <http://github.com/bhuga> | <http://bhuga.net> | <http://blog.datagraph.org>

### Contributing

This repository uses [Git Flow](https://github.com/nvie/gitflow) to mange development and release activity. All submissions _must_ be on a feature branch based on the _develop_ branch to ease staging and integration.

* Do your best to adhere to the existing coding conventions and idioms.
* Don't use hard tabs, and don't leave trailing whitespace on any line.
* Do document every method you add using [YARD][] annotations. Read the
  [tutorial][YARD-GS] or just look at the existing code for examples.
* Don't touch the `.gemspec`, `VERSION` or `AUTHORS` files. If you need to
  change them, do so on your private branch only.
* Do feel free to add yourself to the `CREDITS` file and the corresponding
  list in the the `README`. Alphabetical order applies.
* Do note that in order for us to merge any non-trivial changes (as a rule
  of thumb, additions larger than about 15 lines of code), we need an
  explicit [public domain dedication][PDD] on record from you.

### License

MIT License

[W3C-ruby-rdf mailing list]:        http://lists.w3.org/Archives/Public/public-rdf-ruby/
[Pius Uzamere]: http://pius.me
[Gregg Kellogg]: http://greggkellogg.net/me
[RDF.rb]:           http://rdf.rubyforge.org/
[YARD]:             http://yardoc.org/
[YARD-GS]:          http://rubydoc.info/docs/yard/file/docs/GettingStarted.md
[PDD]:              http://lists.w3.org/Archives/Public/public-rdf-ruby/2010May/0013.html
