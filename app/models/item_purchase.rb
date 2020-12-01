class ItemPurchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :purchase
  has_one_attached :image
end
