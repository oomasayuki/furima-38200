require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '内容に問題ない場合' do
  
   end

   context '内容に問題がある場合' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = 'abc00'
      @user.password_confirmation = 'abc00'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが半角英数字混合でないと登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'ab1234'
      @user.password_confirmation = 'ab12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordとpassword_confirmationが英字のみでは登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordとpassword_confirmationが全角文字を含むと登録できない' do
      @user.password = 'あいうえおか'
      @user.password_confirmation = 'あいうえおか'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'surnameが空では登録できない' do
      @user.surname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'surnameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.surname = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Surname is invalid')
    end
    it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'surname_kanaが空では登録できない' do
      @user.surname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'surname_kanaが全角（カタカナ）でないと登録できない' do
      @user.surname_kana = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Surname kana is invalid')
    end
    it 'first_name_kanaが全角（カタカナ）でないと登録できない' do
      @user.first_name_kana = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'date_of_bithが空では登録できない' do
      @user.date_of_bith = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of bith can't be blank")
    end
  end
  end
end
