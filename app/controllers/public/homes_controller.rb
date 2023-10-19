class Public::HomesController < ApplicationController
  # トップページ
  def top
    @items = Item.all
    # 商品を新着順、４件表示します。
    @items = Item.order('id DESC').limit(4)
  end
  # 会社概要ページ
  def company_profile
  end
end
