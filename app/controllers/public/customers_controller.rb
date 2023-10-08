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

  end

# 顧客退会確認画面
  def unsubscribe

  end

# 顧客退会処理
  def withdraw

  end


end
