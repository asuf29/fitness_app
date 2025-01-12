class Articles::CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: [:edit, :update, :destroy, :like]

  def create
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user
    
    if @comment.save
      redirect_to article_path(@article), notice: "Comment added successfully."
    else 
      redirect_to article_path(@article), notice: "Failed to add comment."
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy 
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  def like
    existing_like = @comment.likes.find_by(user: current_user)
    if existing_like
      existing_like.destroy
      redirect_to article_path(@article), notice: "You unliked the comment."
    else
      @comment.likes.create(user: current_user)
      redirect_to article_path(@article), notice: "You liked the comment."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end
end
