class AddColumnDateOfExpenseToExpensesTable < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :date_of_expense, :date
  end
end
