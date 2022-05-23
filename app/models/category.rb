class Category < ApplicationRecord
  belongs_to :user
  has_one_attached :image, :dependent => :destroy
  has_many :expenses through: :expense_categories, dependent: :destroy
end
