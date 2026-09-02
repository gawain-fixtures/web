module App
  class InvoiceSerializer
    def initialize(invoice)
      @invoice = invoice
    end

    # Invoices for deleted customers have no customer record.
    def as_json
      { id: @invoice.id, customer: @invoice.customer.name, total_cents: @invoice.total_cents }
    end
  end
end
