# encoding: utf-8
require "milo"

describe Milo::Main do
  before(:each) do
      @key = "this_key"
      @milo = Milo::Main.new(@key)
  end

  describe "basic" do
    it "should have the correct mail_url" do
      @milo.main_url.should == "https://api.x.com/milo/v3/"
    end
  end

  describe 'make_request' do
    context "product" do
      it "should construct url for product" do
        response = @milo.make_request("products?product_ids=1234")
        response.url.should == "https://api.x.com/milo/v3/products?product_ids=1234&key=#{@key}"
      end
    end
  end
end
