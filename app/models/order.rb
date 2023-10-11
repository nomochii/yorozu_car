class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

# payment_method(支払い方法)カラムに入る内容
  enum payment_method: { credit_card: 0, transfer: 1 }

end
