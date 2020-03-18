require 'rails_helper'

describe Item do

  describe '#update' do

    # 商品名が空の時に登録できない
    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    # 商品名が40文字以上では登録できない
    it "is invalid with a name that has more than 40 characters " do
      user = build(:user, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:name]).to include("is too long (maximum is 40 characters)")
    end

    # 商品情報が空の時登録できない
    it "is invalid without a info" do
      user = build(:item, info: "")
      user.valid?
      expect(user.errors[:info]).to include("can't be blank")
    end

    # 商品価格が300円以下の時登録できない
    it "is invalid without a price" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    # 商品価格が9999999円以下の時登録できない
    it "is invalid without a price" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    # 商品の状態が空の時登録できない
    it "is invalid without a condition_id" do
      item = build(:item, condition_id: "")
      item.valid?
      expect(item.errors[:condition_id]).to include("を入力してください")
    end

    # 商品の状態がアクティブハッシュの範囲外の時登録できない
    it "is invalid without a condition_id" do
      item = build(:item, condition_id: 7)
      item.valid?
      expect(item.errors[:condition_id]).to include("を入力してください")
    end

    # 都道府県が空の時登録できない
    it "is invalid without a prefecture_id" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end
    
    # 都道府県がアクティブハッシュの範囲外の時登録できない
    it "is invalid without a prefecture_id" do
      item = build(:item, prefecture_id: 48)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    # 配送日時が空の時登録できない
    it "is invalid without a deliverydate_id" do
      item = build(:item, deliverydate_id: "")
      item.valid?
      expect(item.errors[:deliverydate_id]).to include("を入力してください")
    end

    # 配送日時がアクティブハッシュの範囲外の時登録できない
    it "is invalid without a deliverydate_id" do
      item = build(:item, deliverydate_id: 4)
      item.valid?
      expect(item.errors[:deliverydate_id]).to include("を入力してください")
    end

    # 配送する人の選択肢が空の時登録できない
    it "is invalid without a deliverypays_id" do
      item = build(:item, deliverypays_id: "")
      item.valid?
      expect(item.errors[:deliverypays_id]).to include("を入力してください")
    end

    # 配送する人の選択肢がアクティブハッシュの範囲外の時登録できない
    it "is invalid without a deliverypays_id" do
      item = build(:item, deliverypays_id: 3)
      item.valid?
      expect(item.errors[:deliverypays_id]).to include("を入力してください")
    end

    #　カテゴリーの選択肢が空の時登録できない
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