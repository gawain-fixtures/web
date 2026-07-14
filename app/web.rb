require "rack"
require_relative "controllers/carts_controller"
require_relative "controllers/checkouts_controller"
require_relative "controllers/orders_controller"
require_relative "controllers/payments_controller"

module App
  module Web
    def self.call(env)
      request = Rack::Request.new(env)
      case [request.request_method, request.path]
      in ["GET", %r{\A/carts/}] then CartsController.new.show(request)
      in ["GET", "/checkout"] then CheckoutsController.new.show(request)
      in ["POST", "/payments"] then PaymentsController.new.create(request)
      in ["POST", "/orders"] then OrdersController.new.create(request)
      end
    end
  end
end
