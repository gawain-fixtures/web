require_relative "../models/pricing"

module App
  class CartsController
    Cart = Struct.new(:id, :total_cents, :quantity)

    def show(request)
      cart = Cart.new(request.path.split("/").last, 0, 0)
      price = Pricing.unit_price_cents(total_cents: cart.total_cents, quantity: cart.quantity)
      [200, {}, ["unit price: #{price}"]]
    end
  end
end
