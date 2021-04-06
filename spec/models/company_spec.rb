require 'rails_helper'

RSpec.describe Company, type: :model do
  describe "企業新規登録" do
    before do
      @company = FactoryBot.build(:company)
    end
    
    it "全ての項目に正しく入力すれば投稿できる" do
      expect(@company).to be_valid
    end

    it 'emailが空では登録できない' do
      @company.email = ""
      @company.valid?
      expect(@company.errors.full_messages).to include("Email can't be blank")
    end
    
    it 'emailに@を含まないと登録できない' do
      @company.email = "aaaaaa"
      @company.valid?
      expect(@company.errors.full_messages).to include("Email is invalid")
    end
    
    it 'emailの重複登録はできない' do
      @company.save
      another_company = FactoryBot.build(:company)
      another_company.email = @company.email
      another_company.valid?
      expect(another_company.errors.full_messages).to include("Email has already been taken")
      sleep 0.1
    end
    
    it 'passwordが空では登録できない' do
      @company.password = ""
      @company.valid?
      expect(@company.errors.full_messages).to include("Password can't be blank")
    end
    
    it 'passwordは6文字未満だと登録できない' do
      @company.password = "aaa11"
      @company.valid?
      expect(@company.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
    it 'passwordは半角英語のみでは登録できない' do
      @company.password = "aaaaaa"
      @company.valid?
      expect(@company.errors.full_messages).to include("Password is invalid")
    end
    
    it 'passwordは半角数字のみでは登録できない' do
      @company.password = "111111"
      @company.valid?
      expect(@company.errors.full_messages).to include("Password is invalid")
    end
    
    it 'passwordは全角では登録できない' do
      @company.password = "ａａａＡＡＡ"
      @company.valid?
      expect(@company.errors.full_messages).to include("Password is invalid")
    end
    
    it 'password_confirmationが空では登録できない' do
      @company.password_confirmation = ""
      @company.valid?
      expect(@company.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it 'passwordとpassword_confirmationが一致していないと登録できない' do
      @company.password = "aaa111"
      @company.password_confirmation = "qqq111"
      @company.valid?
      expect(@company.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "企業名が空では登録できない" do
      @company.company_name = ""
      @company.valid?
      expect(@company.errors.full_messages).to include("Company name can't be blank")
    end

    it "電話番号が空では登録できない" do
      @company.company_phone = ""
      @company.valid?
      expect(@company.errors.full_messages).to include("Company phone can't be blank")
    end

    it "電話番号は半角数字でないと登録できない" do
      @company.company_phone = "０３１２３４５６７８"
      @company.valid?
      expect(@company.errors.full_messages).to include("Company phone is invalid")
    end

    it "郵便番号が空では登録できない" do
      @company.postal_code = ""
      @company.valid?
      expect(@company.errors.full_messages).to include("Postal code can't be blank")
    end

    it "郵便番号は半角数字でないと登録できない" do
      @company.postal_code = "１２３４５６７"
      @company.valid?
      expect(@company.errors.full_messages).to include("Postal code is invalid")
    end

    it "都道府県が空では登録できない" do
      @company.prefecture_id = ""
      @company.valid?
      expect(@company.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "市区町村が空では登録できない" do
      @company.municipalities = ""
      @company.valid?
      expect(@company.errors.full_messages).to include("Municipalities can't be blank")
    end

    it "番地が空では登録できない" do
      @company.house_number = ""
      @company.valid?
      expect(@company.errors.full_messages).to include("House number can't be blank")
    end

    it "プロフィール画像が空では登録できない" do
      @company.company_image = nil
      @company.valid?
      expect(@company.errors.full_messages).to include("Company image can't be blank")
    end
  
  end
end
