class CommentsController < ApplicationController
before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @my_thread = MyThread.where(:id => params[:my_thread_id]).first
    @comment = @my_thread.comments.build

  end
  def create
    @my_thread = MyThread.where(:id => params[:my_thread_id]).first
    @comment = @my_thread.comments.create(comment_params)
    if @comment.save
      redirect_to my_thread_path(@comment.my_thread_id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to my_thread_path(@comment.my_thread_id)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to my_thread_url(@comment.my_thread_id)

  end

private

def set_comment
  @comment = Comment.find(params[:id])
end

def comment_params
  params.require(:comment).permit(:id, :content, :my_thread_id)
end

end
