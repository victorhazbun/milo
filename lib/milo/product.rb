module Milo
  module Product

    def get_products(options = {})
      base = "products"
      apply_flag(base, "?", options[:show])
      make_request(base)
    end

    def get_product_by_id(id, options = {})
      base = "products?product_ids=#{id}"
      apply_flag(base, "&", options[:show])
      make_request(base)
    end

    def get_product_by_upc(upc, options = {})
      base = "products?q=upc:#{upc}"
      apply_flag(base, "&", options[:show])
      make_request(base)
    end

    private

    def apply_flag(base, identifier, flag)
      base.tap do |b|
        b.concat identifier.concat "show=#{flag}" if flag.present?
      end
    end
  end
end
