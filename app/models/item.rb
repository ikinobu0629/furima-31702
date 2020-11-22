class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :cost
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :status

  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :detail
    validates :price
  end

  validates :area_id, numericality: { other_than: 1 }
  validates :cost_id, numericality: { other_than: 1 }
  validates :day_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
end
