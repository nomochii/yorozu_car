Rails.application.routes.draw do

  # トップ画面

  scope module: :public do
  root to: "homes#top"
  # 会社概要
  get "company_profile" => "homes#company_profile", as: "company_profile"
  get "customers/my_page" => "customers#show"
  resources :customers, only: [:edit, :update, :index]
  # 顧客用
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
  # 管理者用
  # 管理者ログイン
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
