class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:product_name, :image, :amount, :price, :item_id)
  end

end

