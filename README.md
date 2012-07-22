# Milo [![Build Status](https://secure.travis-ci.org/victorhazbun87/milo.png?branch=master)][travis] [![Dependency Status](https://gemnasium.com/victorhazbun87/milo.png?travis)][gemnasium]

[travis]: http://travis-ci.org/victorhazbun87/milo
[gemnasium]: https://gemnasium.com/milo/milo

## Description

Track in real time the price and availability of every product carried by every location of every merchant through eBay Milo API.
More info about eBay Milo API https://www.x.com/developers/documentation-tools/milo/endpoints.html

## Installation

Add this line to your application's Gemfile:

    gem 'milo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install milo

## Usage

First:

    milo = Milo::Main.new("ec17621f92c4b199a7a041bfe27a0c00")

Get all products:

    milo.get_products

Get product by id:

    milo.get_product_by_id("20482374")

Get product by upc code:

    milo.get_product_by_upc("037000185062")

More complex, find by id and pass show options for products:

    milo.get_product_by_id("20482374", show: "PnamePminUpcImg45")

Note: Read about show flag here -> https://www.x.com/developers/documentation-tools/milo/endpoints.html#products-endpoint


## Contributing to Milo

1. Fork the project.
2. Make your feature addition or bug fix.
3. Add tests for it. This is important so I don’t break it in a future version unintentionally.
4. Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull).
5. Send me a pull request. Bonus points for topic branches.
