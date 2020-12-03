class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :address, :phone_number, :building_name, :item_purchase_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :city
    validates :address
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number,  format: { with: /\A\d{11}\z/ }
  end

  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number,  format: { with: /\A\d{11}\z/ }
 
  with_options numericality: { other_than: 1 } do 
    validates :area_id
  end

  def save
    item_purchase = ItemPurchase.create(user_id: user_id, item_id: item_id)
    Purchase.create(postal_code: postal_code, area_id: area_id, city: city, address: address, phone_number: phone_number, building_name: building_name, item_purchase_id: item_purchase.id)
  end
end