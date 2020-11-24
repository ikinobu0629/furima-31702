class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :cost
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :status

  has_one_attached :image
  belongs_to :user

  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  with_options presence: true do
    validates :name
    validates :detail 
  end



  with_options presence: true, numericality: { with: /\A[0-9]+\z/} do
   validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
 
  with_options numericality: { other_than: 1 } do 
   validates :area_id
   validates :cost_id
   validates :day_id
   validates :status_id
   validates :category_id
  end
end
