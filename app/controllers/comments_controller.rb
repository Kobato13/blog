class CommentsController < ApplicationController
  before_action :set_article

  def create
    @comment = @article.comments.build(comment_params)
    
    if @comment.save
      redirect_to article_path(@article)
    else
      @comments = @article.comments
      render 'articles/show'
    end
  end

  def edit
    @comment = @article.comments.find(params[:id])
  end

  def update
    @comment = @article.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to article_path(@article), notice: "A comment was successfully updated"
    else
      flash[:error] = "There are some errors encountered"
      render :edit
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])

    @comment.destroy
    redirect_to article_path(@article), notice: "A comment was successfully destroyed"
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  # def set_comment
  #   @comment = @article.comments.find(params[:id])
  # end
end