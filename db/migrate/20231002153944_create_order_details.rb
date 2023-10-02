class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      # 商品id
      t.integer :item_id, null: false
      # 注文id
      t.integer :order_id, null: false
      # 数量
      t.integer :amount, null: false
      # 購入時価格
      t.integer :purchase_price, null: false
      # 登録・更新日時
      t.timestamps null: false
    end
  end
end
