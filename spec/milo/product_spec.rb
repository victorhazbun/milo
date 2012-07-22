# encoding: utf-8
require "milo"

describe Milo::Main, 'product api' do

  before :each do
    @key = "my_key"
    curl_object = Curl::Easy.method(:new)
    Curl::Easy.stub!(:new).and_return do |*args|
      curl = curl_object.call(*args)
      curl.stub!(:perform)
      curl.stub!(:header_str) { "\r\ntest: blah"}
      curl.stub!(:response_code).and_return(200)
      curl.stub!(:body_str).and_return("{\"pagination\": {\"total_results\": 1, \"per_page\": 30, \"total_pages\": 1, \"page\": 0}, \"products\": [{\"merchants\": [4483], \"min_price\": null, \"name\": \"REDI2SET 43\\\" x 14\\\" Wavy Glass Pattern Frameless Replacement Glass Block Window\", \"max_price\": null, \"product_id\": 20482374}]}")
      curl
    end
  end

  it "should be able to list all" do
    milo = Milo::Main.new(@key)
    response = milo.get_products
    response.url.should == "https://api.x.com/milo/v3/products?key=#{@key}"
    response.status.should == 200
  end

  it "should be able to get by id" do
    milo = Milo::Main.new(@key)
    response = milo.get_product_by_id("20482374")
    response.url.should == "https://api.x.com/milo/v3/products?product_ids=20482374&key=#{@key}"
    response.body.should =~ /Wavy Glass Pattern Frameless Replacement Glass Block Window/
    response.status.should == 200
  end

  it "should be able to get by upc" do
    milo = Milo::Main.new(@key)
    response = milo.get_product_by_upc("037000185062")
    response.url.should == "https://api.x.com/milo/v3/products?q=upc:037000185062&key=#{@key}"
    response.status.should == 200
  end

    it "should be able to get by id with show flag in the show parameter" do
    milo = Milo::Main.new(@key)
    response = milo.get_product_by_id("20482374", show: "PnamePminUpcImg45")
    response.url.should == "https://api.x.com/milo/v3/products?product_ids=20482374&show=PnamePminUpcImg45&key=#{@key}"
    response.status.should == 200
  end

end
