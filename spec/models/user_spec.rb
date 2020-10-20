require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname、email、passwordとpassword_confirmation、lname、fname、lname_kana、fname_kana、birthdayが存在すれば登録できること" do
      @user.valid?
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank", "Password is invalid")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank", "Password is invalid")
    end

    it "emailが@を含まないと登録できない" do
      @user.email = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid", "Password is invalid")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password is invalid")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "123456s"
      @user.password_confirmation = "123456s"
      @user.valid?
    end

    it "passwordが半角英数字混合での入力があれば登録できる" do
      @user.password = "123456s"
      @user.password_confirmation = "123456s"
      @user.valid?
    end

    it "passwordが半角英数字混合での入力がなければ登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
    end

    it "lnameが空では登録できないこと" do
      @user.lname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Lname can't be blank", "Password is invalid")
    end

    it "lnameが全角では登録できないこと" do
      @user.lname = "kakaka"
      @user.valid?
      expect(@user.errors.full_messages).to include("Lname is invalid", "Password is invalid")
    end

    it "fnameが空では登録できないこと" do
      @user.fname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Fname can't be blank", "Password is invalid")
    end

    it "fnameが全角では登録できないこと" do
      @user.fname = "kakaka"
      @user.valid?
      expect(@user.errors.full_messages).to include("Fname is invalid", "Password is invalid")
    end

    it "lname_kanaが空では登録できないこと" do
      @user.lname_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Lname kana can't be blank", "Lname kana is invalid", "Password is invalid")
    end

    it "lname_kanaがカタカナでは登録できないこと" do
      @user.lname_kana = "tests"
      @user.valid?
      expect(@user.errors.full_messages).to include("Lname kana is invalid", "Password is invalid")
    end

    it "fname_kanaが空では登録できないこと" do
      @user.fname_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Fname kana can't be blank", "Fname kana is invalid", "Password is invalid")
    end

    it "fname_kanaがカタカナでは登録できないこと" do
      @user.fname_kana = "tests"
      @user.valid?
      expect(@user.errors.full_messages).to include("Fname kana is invalid", "Password is invalid")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank", "Password is invalid")
    end
    
  end
end    