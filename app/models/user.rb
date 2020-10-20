class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 40 }
  validates :lname, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :fname, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :lname_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :fname_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :birthday, presence: true

  validates :password,length: { minimum: 6},
            format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/}
             



  #has_many :items
  #has_many :purchases
end