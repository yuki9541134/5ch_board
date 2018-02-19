class PostsController < ApplicationController

  def check
    @post = Post.new(name: params[:name], content: params[:content], title_id: params[:id])
    if @post.name == ""
      @post.name="名無しさん"
    end
  end
  
  def create
    @post = Post.new(name: params[:name], content: params[:content], title_id: params[:id])
    @post.save
    redirect_to("/titles/#{@post.title_id}/show")
  end

end
