require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it 'buildingは空でも保存できること' do
      @order_address.building = ''
      expect(@order_address).to be_valid
    end
    it "tokenがあれば保存ができること" do
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'post_codeが空では登録できない' do
      @order_address.post_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが「3桁ハイフン4桁」の半角文字列でないと登録できない' do
      @order_address.post_code = 1234567
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it 'delivery_areaが未選択では登録できない' do
      @order_address.delivery_area_id = '1'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Delivery area can't be blank")
    end
    it 'municipalitiesが空では登録できない' do
      @order_address.municipalities = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
    end
    it 'house_numberが空では登録できない' do
      @order_address.house_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberが空では登録できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが半角数値でないと登録できない' do
      @order_address.phone_number = 'aaaaaaaaaaa'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is not a number")
    end
    it 'phone_numberが10桁以上でないと登録できない' do
      @order_address.phone_number = '123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
    end
    it 'phone_numberが11桁以下でないと登録できない' do
      @order_address.phone_number = '123456789012'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    it 'userが紐付いていないと保存できないこと' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐付いていないと保存できないこと' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
    it "tokenが空では登録できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
end