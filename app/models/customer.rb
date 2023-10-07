class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    # 一致するレコードをデータベースから探し、見つからなかった場合に新しいレコードを作成。
    find_or_create_by!(first_name: '名無し', last_name: '権兵衛', first_name_kana: 'ナナシ', last_name_kana: 'ゴンベエ', email: 'guest@example.com', postal_code: '1102373', address: '福岡県高山市川野区田原3-72', telephone_number: '0901765') do |customer|
      # SecureRandom.urlsafe_base64は、ランダムなURLで安全に使用できるパスワードを生成します。
      customer.password = SecureRandom.urlsafe_base64
    end
  end
end