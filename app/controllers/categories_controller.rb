class CategoriesController < ApplicationController
  include FlashMsgHelper
  before_action :authenticate_user!

  def index; end

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
