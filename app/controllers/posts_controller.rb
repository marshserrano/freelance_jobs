class PostsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Job post created"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @post = current_user.posts.find_by(id: params[:id])
  end

  def update
    @post = current_user.posts.find_by(id: params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Job post updated"
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    flash[:success] = "Job post deleted"
    redirect_to request.referrer || users_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :description, :skills,
                                 :budget, :hours_of_work, :status,
                                 :user_id)
  end
end
