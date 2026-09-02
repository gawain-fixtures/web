require_relative "../serializers/invoice_serializer"

module App
  class InvoiceExportJob
    Invoice = Struct.new(:id, :customer, :total_cents)

    def perform(invoice_id)
      invoice = Invoice.new(invoice_id, nil, 12_500)
      InvoiceSerializer.new(invoice).as_json
    end
  end
end
