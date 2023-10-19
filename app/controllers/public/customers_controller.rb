class Public::CustomersController < ApplicationController

# 顧客マイページ
  def show
    @customer = current_customer
  end

# 顧客マイページ編集
  def edit
    @customer = current_customer
  end

# 顧客マイページ変更更新
  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_my_page_path
  end

# 顧客退会確認画面
  def unsubscribe
  end

# 顧客退会処理
  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted, :id)
  end
end
