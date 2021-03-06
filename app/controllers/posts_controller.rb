class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(title: params[:post][:title], url: params[:post][:url], creator_id: session[:user_id])
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to posts_path
  end
end
