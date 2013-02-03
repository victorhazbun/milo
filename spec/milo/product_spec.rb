# encoding: utf-8
require "milo"
require 'spec_helper'

describe Milo::Main, 'product api' do

  before :each do
    @key = "ffbefff2a246f4c53c0d04ed50bb4707"
  end

  it "should be able to get by id", :vcr do
    milo = Milo::Main.new(@key)
    response = milo.get_product_by_id("20482374")
    response.to_json.should have_json_size(1).at_path("products")
  end

  it "should be able to get by upc", :vcr do
    milo = Milo::Main.new(@key)
    response = milo.get_product_by_upc("037000185062")
    response.to_json.should have_json_size(1).at_path("products")
  end

  it "should be able to get by id with show flag in the show parameter", :vcr do
    milo = Milo::Main.new(@key)
    response = milo.get_product_by_id("20482374", {show: "PnamePminUpcImg45"})
    response.to_json.should have_json_size(1).at_path("products")
    response.to_json.should include_json('http://imagethumbnails.milo.com/035/340/575/45/35340237_34484575_45.jpg'.to_json).at_path("products/0/image_45")
  end

  it "should be able to get by postal code", :vcr do
    milo = Milo::Main.new(@key)
    response = milo.get_product_by_postal_code("07032")
    response.to_json.should have_json_size(30).at_path("products")
  end

  it "should be able to get by postal code with many flags", :vcr do
    milo = Milo::Main.new(@key)
    p response = milo.get_product_by_postal_code("07032", {q: "basketball", show_defaults: "false",  show: "PidPnameMidsPminPmaxDescPurlImg200Rate"})
    response.to_json.should have_json_size(30).at_path("products")
    response.to_json.should include_json("Lifetime 44 in. Streamline Basketball System".to_json).at_path("products/0/name")
  end

end
