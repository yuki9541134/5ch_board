class TitlesController < ApplicationController

  before_action :authenticate_user

  def index
    @titles = Title.all
  end

  def show
    @title = Title.find_by(id: params[:id])
    @posts = Post.where(title_id: params[:id])
    @start_num = 0
    @end_num = @posts.length
    
    if params[:range]
      if params[:range] == "latest50"
        @start_num = @posts.length - 50
        @end_num = @posts.length
      else 
        @start_num = params[:range].split("~")[0].to_i - 1
        @end_num = params[:range].split("~")[1].to_i
      end
    end

    if @start_num < 0
      @start_num = 0
      redirect_to("/titles/#{params[:id]}/show/#{@start_num}~#{@end_num}")
    end

    if @end_num > @posts.length
      @end_num = @posts.length
      redirect_to("/titles/#{params[:id]}/show/#{@start_num}~#{@end_num}")
    end

    @posts = @posts[@start_num, @end_num]
  end

  def create
    @title = Title.new(name: params[:name])
    @title.save
    flash[:notice] = "掲示板をを作成しました"
    redirect_to("/titles/index")
  end
end
