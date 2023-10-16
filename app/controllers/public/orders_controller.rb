class Public::OrdersController < ApplicationController

  def new
     @cart_items = current_customer.cart_items
    if @cart_items == []
      redirect_to root_path
    end
    @order = Order.new
  end

  def create
  end

  def index
  end

  # new 画面から渡ってきたデータをユーザーに確認してもらう
  def confirm
     # new 画面から渡ってきたデータを @order に入れる
    @order = Order.new(order_params)
    @order.shipping_postal_code = current_customer.postal_code
    @order.shipping_address = current_customer.address
    # フルネーム
    @order.shipping_name = current_customer.first_name + current_customer.last_name
    # 送料
    @order.postage = 800
    @cart_items = current_customer.cart_items
    # カート内の合計金額
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    # 請求金額
    @order.total_amount = @total + @order.postage
  end

  def complete
  end

  def show
  end

  private
    def order_params
      params.require(:order).permit(:payment_method)
    end

end
