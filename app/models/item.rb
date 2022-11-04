class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :detail_category
  belongs_to :detail_situation
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_day

  validates :product_name, presence: true, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :detail_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :detail_situation_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality:{ only_onteger: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は ¥300~9,999,999 の間で半角数字で指定してください" }
  validates :image, presence: true
end
