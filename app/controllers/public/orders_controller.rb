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

  def confirm
  end

  def complete
  end

  def show
  end

end
