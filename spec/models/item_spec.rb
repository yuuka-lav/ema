require 'rails_helper'

describe Item do
  describe '#create' do

    it "is valid with a name, info, price, condition_id, deliverydate_id, deliverypays_id, prefecture_id, category_id, brand" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it 'is invalid without a info' do
      item = build(:item, text:"")
      item.valid?
      expect(item.errors[:info]).to include("を入力してください")
    end

    it "is invalid without a price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "is invalid without a condition_id" do
      item = build(:item, condition_id: "")
      item.valid?
      expect(item.errors[:condition_id]).to include("を入力してください")
    end

    it "is invalid without a deliverydate_id" do
      item = build(:item, deliverydate_id: "")
      item.valid?
      expect(item.errors[:deliverydate_id]).to include("を入力してください")
    end

    it "is invalid without a deliverypays_id" do
      item = build(:item, deliverypays_id: "")
      item.valid?
      expect(item.errors[:deliverypays_id]).to include("を入力してください")
    end

    it "is invalid without a prefecture_id" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "is invalid without a category_id" do
      item = build(:item, category_id: category.id)
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "is invalid without a brand" do
      item = build(:item, brand: nil)
      item.valid?
      expect(item.errors[:brand]).to include("を入力してください")
    end

  end

end