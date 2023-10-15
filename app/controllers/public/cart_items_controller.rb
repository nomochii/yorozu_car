class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    # 合計金額
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        if cart_item.item_id == @cart_item.item_id
        new_amount = cart_item.amount + @cart_item.amount
        cart_item.update_attribute(:amount, new_amount)
        @cart_item.delete
        end
      end
      @cart_item.save
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:product_name, :image, :amount, :price, :item_id)
  end

end

