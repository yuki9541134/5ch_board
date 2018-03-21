class PostsController < ApplicationController

  before_action :authenticate_user
  
  def check
    @post = Post.new(
      name: params[:name],
      content: params[:content],
      title_id: params[:id],
      user_id: @current_user.id
      )
    if @post.name == ""
      @post.name="名無しさん"
    end

    if @post.valid?
      flash[:notice] = nil
    else
      flash[:notice] = "入力内容に間違いがあります。"
    end
  end
  
  def create
    @post = Post.new(
      name: params[:name], 
      content: params[:content], 
      title_id: params[:id],
      user_id: @current_user.id
      )
    
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to("/titles/#{@post.title_id}/show")
    else
      
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save
    flash[:notice] = "投稿を編集しました"
    redirect_to("/titles/#{@post.title_id}/show")
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/titles/#{@post.title_id}/show")
  end

end
