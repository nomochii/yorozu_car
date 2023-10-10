class Public::ItemsController < ApplicationController

  def index
     @items = Item.page(params[:page])
  end

  def show
    @item = Item.all
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end

end
