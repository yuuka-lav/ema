require 'rails_helper'

describe Item do
  describe '#create' do


    # 名前が空であると保存できない
    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a info" do
      item = build(:item, info: "")
      item.valid?
      expect(item.errors[:info]).to include("を入力してください")
    end

    it "is invalid without a price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "is invalid without a brand" do
      item = build(:item, brand: "")
      item.valid?
      expect(item.errors[:brand]).to include("can't be blank")
    end

    it "is invalid without a condition_id" do
      item = build(:item, condition_id: "")
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

    it "is invalid without a deliverydate_id" do
      item = build(:item, deliverydate_id: "")
      item.valid?
      expect(item.errors[:deliverydate_id]).to include("can't be blank")
    end

    it "is invalid without a deliverypays_id" do
      item = build(:item, deliverypays_id: "")
      item.valid?
      expect(item.errors[:deliverypays_id]).to include("can't be blank")
    end

    it "is invalid without a prefecture_id " do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end

    it "is invalid without a category_id " do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

  end

end