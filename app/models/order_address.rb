class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :delivery_area_id, :municipalities, :house_number, :building, :phone_number, :item_id, :user_id, :token

  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipalities, presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true },length: { minimum: 10, maximum: 11 }
  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :token, presence: true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, delivery_area_id: delivery_area_id, municipalities: municipalities, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end
