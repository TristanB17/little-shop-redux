class Invoice < ActiveRecord::Base
  validates_presence_of :merchant_id, :status

  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.get_quantity(invoice_id)
    InvoiceItem.where(invoice_id: invoice_id)
  end

  def get_total_price(invoice_id)
    ii = InvoiceItem.where(invoice_id: invoice_id)
    ii.sum("invoice_items.unit_price * invoice_items.quantity")
  end

  def self.percent_shipped
    shipped = Invoice.all.where(status: 'shipped').count
    avg = shipped.to_f/Invoice.all.count
    avg * 100
  end

  def self.percent_pending
    100 - percent_shipped
  end
end
