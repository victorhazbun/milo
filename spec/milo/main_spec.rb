# encoding: utf-8
require "milo"
require 'spec_helper'

describe Milo::Main do
  before(:each) do
    @key = "ffbefff2a246f4c53c0d04ed50bb4707"
    @milo = Milo::Main.new(@key)
  end

  describe "basic" do
    it "should have the correct mail_url", :vcr do
      @milo.main_url.should == "https://api.x.com/milo/v3/"
    end
  end

  describe 'make_request' do
    context "product" do
      it "should contains one product matching with given a id", :vcr do
        result = @milo.make_request("products?product_ids=20482374")
        result.to_json.should have_json_size(1).at_path("products")
      end

      it "should contains the product with the same id given in the path", :vcr do
        result = @milo.make_request("products?product_ids=20482374")
        result.to_json.should have_json_type(Integer).at_path("products/0/product_id")
      end
    end
  end
end
