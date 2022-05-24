class ExpensesController < ApplicationController
  include FlashMsgHelper
  before_action :authenticate_user!

  def new
    @expense = Expense.new
    @categories = Category.all.order(:name)
  end

  def create
    @expense = Expense.new(expense_params)
    params[:expense][:categories].each do |category|
      @expense.categories << Category.find(category)
    end
    @categories = Category.all
    @expense.user_id = current_user.id
    if @expense.save
      success('New expense was successfully created.', redirect: true)
      redirect_to new_expense_path
    else
      failure('Expense was not created because: ', @expense)
      render :new
    end
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, :date_of_expense, :categories)
  end

  private :expense_params
end
