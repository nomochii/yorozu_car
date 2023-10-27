class Admin::OrdersController < ApplicationController

  def index
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

end
