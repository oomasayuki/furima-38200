class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :delivery_area_id, :municipalities, :house_number, :building, :phone_number, :item_id, :user_id, :token

with_options presence: true do
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :municipalities
  validates :house_number
  validates :phone_number, numericality: { only_integer: true },length: { minimum: 10, maximum: 11 }
  validates :item_id
  validates :user_id
  validates :token
end

  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }
  
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, delivery_area_id: delivery_area_id, municipalities: municipalities, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end
