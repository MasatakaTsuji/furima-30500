class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :ship_date

  with_options presence: true do
    validates :name, :description, :image
    validates :selling_price, format: { with: /\A[a-zA-Z0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

    with_options numericality: { other_than: 1 } do
      validates :category_id, :status_id, :burden_id, :prefecture_id, :ship_date_id
    end
  end
end
