class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @ukulele = @comment.ukulele

    respond_to do |format|
      if @comment.save
        format.html { redirect_to ukulele_path(@ukulele), notice: 'コメントを投稿しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @ukulele = @comment.ukulele
  end

  def update
        respond_to do |format|
      if @comment.update(comment_params) then
        format.html { redirect_to ukulele_path(@comment.ukulele), notice: 'コメントを更新しました。' }
        format.js { render :index }
      else
        format.html { redirect_to ukulele_path(@comment.ukulele), notice: 'コメントを更新しませんでした。' }
        format.js { render :index }
      end
    end
  end

  def destroy
    respond_to do |format|
      @comment.destroy
      format.html { redirect_to ukulele_path(@comment.ukulele), notice: 'コメントを削除しました。' }
      format.js { render :index }
    end
  end

private

  def comment_params
    params.require(:comment).permit(:ukulele_id, :content)
  end

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

end
