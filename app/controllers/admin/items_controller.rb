class Admin::ItemsController < ApplicationController
  # 商品投稿の画面を表示
  def new
    # form_with に渡すための「空のモデル」代入
    @newitem = Item.new
  end

  # 投稿データの保存
  def create
    # ITEMモデルに紐づくデータとして保存する準備(パラメーターのデータを@newitemに格納)
    @newitem = Item.new(item_params)
    # データ保存
    @newitem.save
  end

  def index

  end


  def edit

  end

  def show

  end

  def destroy

  end

  def update

  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :product_name, :year, :mileage, :inspection, :repair, :maintenance, :price)
  end
end

