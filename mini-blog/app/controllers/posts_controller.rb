class PostsController < ApplicationController
  def index
    @posts = Post.all.order("id DESC").page(params[:page]).per(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
  end



 private

# ストロングパラメータを設定
 def post_params
  params.require(:post).permit(:text)
 end





end
