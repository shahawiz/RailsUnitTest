class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    return redirect_to posts_path, flash: {message: 'Post Created :)'} if @post.persisted?
    render :new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update 
    @post = Post.find(params[:id])
    return redirect_to posts_path if @post.update(post_params)
    render :edit
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to posts_path
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
