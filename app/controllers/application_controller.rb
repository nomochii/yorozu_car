class ApplicationController < ActionController::Base
  # ユーザ登録、ログイン認証などが使われる前に
  # configure_permitted_parametersメソッドが実行されます。
  before_action :configure_permitted_parameters, if: :devise_controller?

private
# 管理者ログイン後の遷移先
def after_sign_in_path_for(resource_or_scope)
  if resource_or_scope.is_a?(Admin)
    # 管理者用のトップページ（注文履歴一覧）
        admin_path
  end
end
# ログアウト後の遷移先
def after_sign_out_path_for(resource_or_scope)
  # 顧客側・・トップページ
  if resource_or_scope == :customer
        root_path
  # 管理者側・・# 管理者ログイン画面
  elsif resource_or_scope == :admin
        new_admin_session_path
  end
end

protected
  # ユーザー登録(sign_up)の際に、keys:内のデータ操作を許可しています。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :postal_code, :address, :telephone_number, :password])
  end
end
