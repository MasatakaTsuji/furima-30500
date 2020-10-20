class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :ship_date
  
  with_options presence: true do
    validates :name,:description,:selling_price

    with_options numericality: { other_than: 1 } do
     validates :category_id,:status_id,:burden_id,:prefectures_id ,:ship_date_id 
    end
  end 
   
end
