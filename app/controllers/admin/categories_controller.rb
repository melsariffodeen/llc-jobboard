class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to :admin_categories
    else
      render 'new'
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
