class CommentsController < ApplicationController

  def new


    @my_thread = MyThread.where(:id => params[:my_thread_id]).first
    @comment = @my_thread.comments.build

  end
  def create
    @my_thread = MyThread.where(:id => params[:my_thread_id]).first


    @comment = @my_thread.comments.create(comment_params)


    redirect_to my_thread_path(@comment.my_thread_id)
  end

  def edit
    @comment = Comment.find(params[:id])

  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to my_thread_path(@comment.my_thread_id)

  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to my_thread_url(@comment.my_thread_id)

  end

private
def comment_params
  params.require(:comment).permit(:id, :content, :my_thread_id)
end

end
