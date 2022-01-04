class CategoriesController < ApplicationController
  
  before_action :set_category, only: [:show]

  def index
    @categories = Category.all
  end

  def show
    @articles = @category.articles.where.not(id: nil)
  end


  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
