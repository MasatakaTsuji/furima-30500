class OrderShip
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postalcode, :prefecture_id, :shipaddess, :shiptoaddess, :shipbuilding, :mobile, :token

  validates :prefecture_id, presence: true, numericality: { other_than: 1 }

  with_options presence: true do
    validates :shipaddess, :shiptoaddess, :token
    validates :postalcode, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :mobile, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Ship.create(postalcode: postalcode, prefecture_id: prefecture_id, shipaddess: shipaddess, shiptoaddess: shiptoaddess, shipbuilding: shipbuilding, mobile: mobile, order_id: order.id)
  end
end
