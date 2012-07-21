module Milo
  module Product

    def get_products(options = {})
      base = "products"
      base.tap do |b|
        b + "?show=#{options[:show]}" if options[:show].present?
      end
      make_request("products")
    end

    def get_product_by_id(id, options = {})
      base = "products?product_ids=#{id}"
      base.tap do |b|
        b.concat("&show=#{options[:show]}") if options[:show].present?
      end
      make_request(base)
    end

    def get_product_by_upc(upc, options = {})
      base = "products?q=upc:#{upc}"
      base.tap do |b|
        b + "&show=#{options[:show]}" if options[:show].present?
      end
      make_request(base)
    end
  end
end
