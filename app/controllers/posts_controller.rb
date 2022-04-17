class PostsController < ApplicationController
  before_action :login?, only: [:index, :create, :show]
  def index
    @post = Post.new
    @post.user_id = current_user.id
    @posts = Post.all.order(created_at: :desc)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
  if @post.save
    redirect_to posts_path, notice: "投稿しました。"
  else
    flash[:alert] = "必須項目を入力してください。"
    redirect_to posts_path
  end
  end

  def show
    @post = Post.find(params[:id])
  end



  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "削除できました。"
  end

  def search
    @keyword = params[:keyword]
    @posts = Post.search(params[:keyword])
    render "index"
  end



   private
  def post_params
    params.require(:post).permit(:company_name, :number, :type, :question_a, :question_b, :question_c, :question_c, :question_d, :question_e, :question_f, :question_g, :question_h, :question_i, :question_j, :question_k, :question_l, :question_m, :question_n, :introduction)
  end

end
