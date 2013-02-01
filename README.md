# bio-unichem

[![Build Status](https://secure.travis-ci.org/nakao/bio-unichem.png)](http://travis-ci.org/nakao/bio-unichem)

BioRuby plugin for [UniChem REST Webservice](https://www.ebi.ac.uk/unichem/info/webservices).

REST API address
```ruby
   BioUniChem::REST::UniChem_URI.src_compound_id("CHEMBL12", "1", "2")
   #=> "http://www.ebi.ac.uk/unichem/rest/src_compound_id/CHEMBL12/1/2"
   
   BioUniChem::REST::UniChem_URI.mapping("4", "1")
   #=> "http://www.ebi.ac.uk/unichem/rest/mapping/4/1"
```

Get Data 
```ruby
   client = BioUniChem::REST.new
   result = client.src_compound_id("CHEMBL12", "1", "2")
   p result 
   #=> [{"src_compound_id"=>"DB00829"}]
```

The Ruby script bellow utilizes the Bio UniChem module
```ruby
   require 'bio-unichem'

   ## --------------------------
   ## create client ...
   client = BioUniChem::REST.new

   ## --------------------------
   ## get the data ...
   result = client.src_compound_id("CHEMBL12", "1")
   
   ## --------------------------
   ## print ...
   p result   
``` 

Note: this software is under active development!

## Installation

```sh
    gem install bio-unichem
```

## Usage

```ruby
    require 'bio-unichem'
```

The API doc is online. For more code examples see the test files in
the source tree.
        
## Project home page

Information on the source tree, documentation, examples, issues and
how to contribute, see

  http://github.com/nakao/bio-unichem

The BioRuby community is on IRC server: irc.freenode.org, channel: #bioruby.

## Cite

If you use this software, please cite one of
  
* [BioRuby: bioinformatics software for the Ruby programming language](http://dx.doi.org/10.1093/bioinformatics/btq475)
* [Biogem: an effective tool-based approach for scaling up open source software development in bioinformatics](http://dx.doi.org/10.1093/bioinformatics/bts080)

## Biogems.info

This Biogem is published at [#bio-unichem](http://biogems.info/index.html)

## Copyright

Copyright (c) 2013 Mitsuteru Nakao. See LICENSE.txt for further details.

