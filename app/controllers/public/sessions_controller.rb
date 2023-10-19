# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, only: [:create]

 # ゲストログイン用
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def after_sign_in_path_for(resource)
      root_path
  end

  protected
    # 退会しているかを判断するメソッド
    def customer_state
      # 入力されたemailからアカウントを1件取得
      @customer = Customer.find_by(email: params[:customer][:email])
      # アカウントを取得できなかった場合、このメソッドを終了する
      return if !@customer
      # 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
      if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == false)
        redirect_to new_customer_registration
      else
        render :create
      end
    end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :postal_code, :address, :telephone_number, :password])
  end
end
