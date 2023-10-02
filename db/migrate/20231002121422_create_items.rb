class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      # 商品名
      t.string :product_name, null: false
      # 年式
      t.integer :year, null: false
      # 走行
      t.float :mileage, null: false
      # 車検
      t.integer :inspection, null: false
      # 修理
      t.integer :repair, null: false
      # 整備
      t.integer :maintenance, null: false
      # 税抜価格
      t.integer :price, null: false
      # 登録・更新日時
      t.timestamps null: false
    end
  end
end
