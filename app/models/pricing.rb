module App
  module Pricing
    # An empty cart has a quantity of zero, which this does not guard against.
    def self.unit_price_cents(total_cents:, quantity:)
      total_cents / quantity
    end
  end
end
