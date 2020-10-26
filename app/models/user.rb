class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, length: { maximum: 40 }
    validates :lname, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :fname, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :lname_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :fname_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
    validates :password, length: { minimum: 6 },
                         format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/ }
  end

  has_many :items
  # has_many :purchases
end
