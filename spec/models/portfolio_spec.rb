require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  describe "ポートフォリオ新規投稿" do
    before do
      @portfolio = FactoryBot.build(:portfolio)
    end

    it "全ての項目に正しく入力すれば投稿できる" do
      expect(@portfolio).to be_valid
    end

    it "ポートフォリオ名が空では投稿できない" do
      @portfolio.portfolio_name = ""
      @portfolio.valid?
      expect(@portfolio.errors.full_messages).to include("Portfolio name can't be blank")
    end

    it "ポートフォリオ詳細が空では投稿できない" do
      @portfolio.detail = ""
      @portfolio.valid?
      expect(@portfolio.errors.full_messages).to include("Detail can't be blank")
    end

    it "開発言語が空では投稿できない" do
      @portfolio.development_language_id = ""
      @portfolio.valid?
      expect(@portfolio.errors.full_messages).to include("Development language can't be blank")
    end

    it "販売タイプが空では投稿できない" do
      @portfolio.sale_type_id = ""
      @portfolio.valid?
      expect(@portfolio.errors.full_messages).to include("Sale type can't be blank")
    end

    it "ポートフォリオ画像が空では投稿できない" do
      @portfolio.images = nil
      @portfolio.valid?
      expect(@portfolio.errors.full_messages).to include("Images can't be blank")
    end

    it "販売価格は半角数字でないと投稿できない" do
      @portfolio.price = "１０００"
      @portfolio.valid?
      expect(@portfolio.errors.full_messages).to include("Price is invalid")
    end

    it 'ユーザーが紐付いていなければ投稿できない' do
      @portfolio.user = nil
      @portfolio.valid?
      expect(@portfolio.errors.full_messages).to include("User must exist")
    end

    it "販売する場合、価格が空では投稿できない" do
      @portfolio.sale_type_id = 0
      @portfolio.price = ""
      @portfolio.valid?
      expect(@portfolio.errors.full_messages).to include("Price can't be blank")
    end

  end
end
