require_relative "../services/payment_gateway"

module App
  class PaymentsController
    def create(_request)
      PaymentGateway.new.charge(order_id: 1042, amount_cents: 4_999)
      [201, {}, ["charged"]]
    end
  end
end
