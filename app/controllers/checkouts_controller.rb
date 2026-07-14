module App
  class CheckoutsController
    # The staging settings never got a tax_region.
    SETTINGS = { "currency" => "USD", "locale" => "en-US" }.freeze

    def show(_request)
      region = SETTINGS.fetch("tax_region")
      [200, {}, ["tax region: #{region}"]]
    end
  end
end
