require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "メッセージ投稿" do
    before do
      @message = FactoryBot.build(:message)
    end

    it "テキストと画像が存在すれば送信できる" do
      expect(@message).to be_valid
    end

    it "テキストがあれば送信できる" do
      @message.message_image = nil
      expect(@message).to be_valid
    end

    it "画像があれば送信できる" do
      @message.content = ""
      expect(@message).to be_valid
    end

    it "テキストも画像もなければ送信できない" do
      @message.content = ""
      @message.message_image = nil
      expect(@message.errors.full_messages).to include("Content can't be blank")
    end

  end
end
