class ApplicationController < ActionController::Base
  # ユーザ登録、ログイン認証などが使われる前に
  # configure_permitted_parametersメソッドが実行されます。
  before_action :configure_permitted_parameters, if: :devise_controller?

protected
  # ユーザー登録(sign_up)の際に、keys:内のデータ操作を許可しています。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :postal_code, :address, :telephone_number, :password])
  end
end
