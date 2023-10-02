class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      # 顧客id
      t.integer :customer_id, null: false
      # 配送先宛名
      t.string :shipping_name, null: false
      # 配送先住所
      t.string :shipping_address, null: false
      # 配送先郵便番号
      t.string :shipping_postal_code, null: false
      # 送料
      t.integer :postage, null: false
      # 請求額
      t.integer :total_amount, null: false
      # 支払方法
      t.integer :payment_method, null: false
      # 登録・更新日時
      t.timestamps null: false
    end
  end
end
