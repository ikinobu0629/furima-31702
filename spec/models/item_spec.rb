require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
   
  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "imageとnameとdetailとpriceとcategory_idとstatus_idとcost_idとarea_idとday_idが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいくとき' do
      it "imageがない時" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空の時" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "detailが空の時" do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it "category_idが1の時" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "status_idが1の時" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "cost_idが1の時" do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost must be other than 1")
      end
      it "area_idが1の時" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it "day_idが1の時" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end
      it "priceが空の時" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが299以下の時" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが10000000以上の時" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "priceが半角数字以外の時" do
        @item.price = '１００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end