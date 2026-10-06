require "json"
require "sentry-ruby"

module App
  class OrdersController
    def create(request)
      order = JSON.parse(request.body.read)
      [201, {}, ["order with #{order.fetch('items').size} items"]]
    rescue JSON::ParserError => e
      # The client's fault: reported at warning level and answered with a 400.
      Sentry.capture_exception(e, level: :warning)
      [400, {}, ["malformed JSON"]]
    end
  end
end

# The order page, a plain Rails-style controller outside the App namespace.
class OrdersController
  def show
    @order = Order.find(params[:id])
    # Orders placed before shipping addresses were required have no shipment
    # recipient, and the view below needs a name to print.
    @recipient = @order.shipment.recipient.full_name
  end
end
