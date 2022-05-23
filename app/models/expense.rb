class Expense < ApplicationRecord
  belongs_to :user
  # has_many :categories through: :expense_categories, dependent: :destroy

  validates :name, presence: true
  validates_length_of :name, maximum: 200
  validates :amount, presence: true, numericality: { greater_than: 0, less_than: 100000000 }
  validates :user_id, presence: true

end
