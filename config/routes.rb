Rails.application.routes.draw do

# （（顧客用））
  scope module: :public do
  # トップ画面
  root to: "homes#top"

  # 会社概要
  get "company_profile" => "homes#company_profile", as: "company_profile"

  # マイページ
  get "customers/my_page" => "customers#show"
  resources :customers, only: [:edit, :update]

  # 退会確認画面
  get  '/customers/unsubscribe' => 'customers#unsubscribe'

  # 退会処理（論理削除用）
  patch  '/customers/withdraw' => 'customers#withdraw'

  # 商品
  resources :items, only: [:show, :index]

  # カート内商品全て削除
  delete "cart_items/destroy_all"=> "cart_items#destroy_all"

  # カート内商品
  resources :cart_items, only: [:index, :update, :destroy, :create]
 end

 # 顧客ログイン・新規登録
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # 顧客用ゲストログイン
  devise_scope :customer do
  post 'customer/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end



# （（管理者用））
  namespace :admin do
  # 管理者トップページ（注文履歴一覧）
  get "admin" => "homes#top", as: "/"
  # 商品
  resources :items, only: [:show, :edit, :update, :index, :new, :create]
  end
  # 管理者ログイン
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
