class CategoriesController < ApplicationController
  include FlashMsgHelper
  before_action :authenticate_user!

  def index
    @categories = Category.with_attached_image.find_by_sql("SELECT categories.*, 
      SUM(expenses.amount) as total_amount 
      from categories 
      LEFT JOIN categories_expenses ON categories.id = categories_expenses.category_id 
      LEFT JOIN expenses on categories_expenses.expense_id = expenses.id 
      WHERE categories.user_id = #{current_user.id} GROUP BY categories.id");

     @total_amount = @categories.map { |category| category.total_amount }.compact.sum

     @this_month = 0

     @categories.each do |category|
        if category.expenses.length > 0
          @this_month += category.expenses
                        .where('date_of_expense >= ?', Date.today.beginning_of_month)
                        .where('date_of_expense <= ?', Date.today.end_of_month)
                        .sum(:amount)
        end
     end
    end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      success('New category was successfully created.', redirect: true)
      redirect_to authenticated_root_path
    else
      failure('Category was not created because: ', @category)
      render :new
    end
  end

  def category_params
    params.require(:category).permit(:name, :image)
  end
end
