class Public::OrdersController < ApplicationController

  def new
     @cart_items = current_customer.cart_items
    if @cart_items == []
      redirect_to root_path
    end
    @order = Order.new
  end

  def create
    # 確認画面から送られてきた情報を取得
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    # Orderモデルに注文を保存
    order.save
    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
      # カート内商品の情報をすべて取得し１つずつ格納する必要があります。
      @order = OrderDetail.new
      @order.order_id = order.id
      @order.item_id = cart_item.item.id
      @order.amount = cart_item.amount
      # 購入時価格
      @order.purchase_price = cart_item.item.price * 1.1
      # # OrderDetailモデルにカート内商品の情報をもとに保存。
      @order.save!
    end
      # カート内商品を全てOrderDetailモデルに格納し終わると、カート内商品を全て削除します。
      @cart_items.destroy_all
      redirect_to orders_complete_path
  end

  def index
    @orders = current_customer.orders.all
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
    params.require(:order).permit(:shipping_postal_code, :shipping_address, :shipping_name, :payment_method, :customer_id, :total_amount, :postage )
  end

end
