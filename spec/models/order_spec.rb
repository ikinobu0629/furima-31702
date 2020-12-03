require 'rails_helper'
RSpec.describe Order, type: :model do
  before do
    buyer = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: buyer.id, item_id: item.id )
    sleep(1)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it "tokenとpostal_codeとarea_idとcityとaddressとbuilding_nameとphone_numberが存在すれば購入できる" do
        expect(@order).to be_valid
      end
      it "building_nameが空でも購入できる" do
        @order.building_name = nil
        expect(@order).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "tokenがない時" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeがない時" do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeにハイフンがない時" do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end
      it "area_idが1の時" do
        @order.area_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Area must be other than 1")
      end
      it "cityがない時" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "addressがない時" do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberがない時" do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberにハイフンがある時" do
        @order.phone_number = '080-0000-0000'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが12桁以上の時" do
        @order.phone_number = '080999999999'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
