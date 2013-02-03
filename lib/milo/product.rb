module Milo
  module Product

    def get_product_by_id(id, options = {})
      base = "products?product_ids=#{id}"
      result = apply_flag(base, options)
      make_request(result)
    end

    def get_product_by_upc(upc, options = {})
      base = "products?q=upc:#{upc}"
      result = apply_flag(base, options)
      make_request(result)
    end

    def get_product_by_postal_code(code, options = {})
      base = "products?postal_code=#{code}"
      result = apply_flag(base, options)
      make_request(result)
    end

    private

    def apply_flag(base, options = {})
      return base if options == {}
      hash = {}
      hash.merge!(show: options[:show]) if options[:show]
      hash.merge!(q: options[:q]) if options[:q]
      hash.merge!(show_defaults: options[:show_defaults]) if options[:show_defaults]
      base + "&" + hash.to_query
    end
  end
end
