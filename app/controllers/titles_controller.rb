class TitlesController < ApplicationController
  def index
    @titles = Title.all
  end

  def show
    @title = Title.find_by(id: params[:id])
    @posts = Post.where(title_id: params[:id])
  end

  def create
    @title = Title.new(name: params[:name])
    @title.save
    redirect_to("/titles/index")
  end
end
