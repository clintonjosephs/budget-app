class Category < ApplicationRecord
  include ImageHelper

  belongs_to :user
  has_one_attached :image, :dependent => :destroy
  has_many :expenses through: :expense_categories, dependent: :destroy
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true
  validates :image_type
  validates :image_size
end
