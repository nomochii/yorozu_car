class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  # 税込小計
  def subtotal
    item.add_tax_price * amount
  end
end
