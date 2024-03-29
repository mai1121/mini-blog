class PostsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @posts = Post.all.order("id DESC").page(params[:page]).per(5).includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(text: post_params[:text],user_id: current_user.id)

  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.destroy
    else
      flash[:notice] = "権限がありません"
      redirect_to action: :index
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.update(post_params)
    else
      flash[:notice] = "権限がありません"
      redirect_to action: :index
    end
  end

  def show
  end



 private

# ストロングパラメータを設定
 def post_params
  params.require(:post).permit(:text)
 end

 def move_to_index
  redirect_to action: :index unless user_signed_in?
 end






end
