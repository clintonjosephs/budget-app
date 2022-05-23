class Expense < ApplicationRecord
  belongs_to :user
  has_many :categories through: :expense_categories, dependent: :destroy
end
