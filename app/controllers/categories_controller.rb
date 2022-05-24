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

    # @current_month_amount = @categories.where('extract(month from date_of_expense) = ?', Time.now.month).sum(:total_amount)
    # @highest_month = @categories.where('extract(month from date_of_expense) = ?', Time.now.month).order('total_amount DESC').first
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
