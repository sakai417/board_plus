class MyThreadsController < ApplicationController

    before_action :set_my_thread, only: [:show, :edit, :update, :destroy]

    def index
      @my_threads = MyThread.all
    end

    def new
      @my_thread = MyThread.new
    end

    def create
      @my_thread = MyThread.new(my_thread_params)
      # saveされてたらredirectでindexにいく
      if @my_thread.save
        redirect_to my_threads_path
        # validateで弾かれてsaveに失敗したらnewにリダイレクト
      else
        render 'new'
      end
    end
    def show
      @comments = Comment.where(my_thread_id: params[:id])
    end

    def edit
    end

    def update
      @my_thread.update(my_thread_params)
      redirect_to my_thread_path(@my_thread)
    end

    def destroy
      @my_thread.destroy
      redirect_to my_threads_url(@my_thread)
    end

    private
    def my_thread_params
      params[:my_thread].permit(:title, :overview)
    end

    def set_my_thread
      @my_thread = MyThread.find(params[:id])
    end
  end
