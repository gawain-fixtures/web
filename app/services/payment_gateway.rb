require "faraday"

module App
  class PaymentGateway
    def initialize(connection: Faraday.new(url: "https://gateway.example.com"))
      @connection = connection
    end

    def charge(order_id:, amount_cents:)
      @connection.post("/v1/charges", order_id: order_id, amount_cents: amount_cents)
    end
  end
end
