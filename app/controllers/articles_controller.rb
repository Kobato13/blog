class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:edit, :update, :destroy, :show]

  def index
    #articles = Article.all

    # Instance variable sa isang class
    @articles = Article.all

    #render 'two'
  end

  def show
    @comments = @article.comments.where.not(id: nil)
    @comment = @article.comments.build

    @categories = @article.categories.where.not(id: nil)
  end

  def new 
    @article = Article.new
    @article.categories.build
  end

  def create

    #article_params = params.require(:article).permit(:title, :author, :content)
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "An article was successfully created"
      redirect_to articles_path
    else
      flash[:error] = "There are some errors encountered"
      render :new
    end

  end

  def edit
    #@article = Article.find(params[:id])
  end

  def update
    #@article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to articles_path, notice: "An Article was successfully updated"
    else
      flash[:error] = "There are some errors encountered"
      render :edit
    end
  end

  def destroy
    #@article = Article.find(params[:id])

    @article.destroy

    redirect_to articles_path, notice: "An Article was successfully destroyed"
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(
      :title, :author, :content, categories_attributes: [:id, :name])
  end

  # def two
  
  # end
end
