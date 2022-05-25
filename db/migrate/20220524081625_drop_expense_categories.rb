class DropExpenseCategories < ActiveRecord::Migration[7.0]
  def change
    drop_table :expense_categories
  end
end
