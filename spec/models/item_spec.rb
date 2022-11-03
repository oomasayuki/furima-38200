require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'product_nameが空では登録できない' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it 'product_nameが41文字以上では登録できない' do
      @item.product_name = Faker::Internet.password(min_length: 41)
      @item.valid?
      expect(@item.errors.full_messages).to include('Product name is too long (maximum is 40 characters)')
    end
    it 'explanationが空では登録できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'explanationが1001文字以上では登録できない' do
      @item.explanation = Faker::Internet.password(min_length: 1001)
      @item.valid?
      expect(@item.errors.full_messages).to include('Explanation is too long (maximum is 1000 characters)')
    end
    it 'detail_categoryが---では登録できない' do
      @item.detail_category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail category can't be blank")
    end
    it 'detail_situationが---では登録できない' do
      @item.detail_situation_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail situation can't be blank")
    end
    it 'delivery_chargeが---では登録できない' do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end
    it 'delivery_areaが---では登録できない' do
      @item.delivery_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery area can't be blank")
    end
    it 'delivery_dayが---では登録できない' do
      @item.delivery_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day can't be blank")
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが299円以下では登録できない' do
      @item.price = Faker::Number.between(from: 0, to: 299)
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it 'priceが10000000円以上では登録できない' do
      @item.price = Faker::Number.between(from: 10_000_000, to: 999_999_999)
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it 'priceが半角数値でないと登録できない' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
  end
end
