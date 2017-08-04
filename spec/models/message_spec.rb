require 'rails_helper'

describe Message do
  describe '#create' do


    it "is valid with a body, group_id, user_id" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is valid with a image, group_id, user_id" do
      message = build(:message)
      expect(message).to be_valid
    end
  
    it "is valid with a body, image, group_id, user_id" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is invalid without a body and image" do
      message = build(:message, body: "", image: "")
      message.valid?
      expect(message.errors[:body_or_image]).to include("を入力してください。")
    end

    it "is invalid without a group_id" do
      message = build(:message, group_id: "")
      message.valid?
      expect(message.errors[:group_id]).to include("を入力してください。")
    end

    it "is invalid without a user_id" do
      message = build(:message, user_id: "")
      message.valid?
      expect(message.errors[:user_id]).to include("を入力してください。")
    end

  end
end
