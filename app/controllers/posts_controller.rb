class PostsController < ApplicationController
  def index
    @post = Post.new
    @post.user_id = current_user.id
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "削除できました。"
  end

   private
  def post_params
    params.require(:post).permit(:company_name, :number, :type, :question, :introduction)
  end
end
