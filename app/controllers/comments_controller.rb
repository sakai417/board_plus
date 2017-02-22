class CommentsController < ApplicationController

  def new
    @my_thread = MyThread.where(:id => params[:my_thread_id]).first
    @comment = @my_thread.comments.build
  end
end
