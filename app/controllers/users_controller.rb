class UsersController < ApplicationController
	before_action :authenticate_user, {only: [:show]}
	before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}

	def new
		@user = User.new
	end

	def create
		@user = User.new(
		name: params[:name],
		mail: params[:mail],
		password: params[:password]
		)
		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = "ユーザー登録が完了しました"
			redirect_to("/users/#{@user.id}")
		else
			render("users/new")
		end
	end

	def show
		@user = User.find_by(id: params[:id])
	end

	def login_form
	end
	
	def login
	  @user = User.find_by(mail: params[:mail])
	  if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			flash[:notice] = "ログインしました"
			redirect_to("/users/#{@user.id}")
	  else
			@error_message = "メールアドレスまたはパスワードが間違っています"
			@mail = params[:mail]
			@password = params[:password]
			render("users/login_form")
	  end
	end
	
	def logout
	  session[:user_id] = nil
	  flash[:notice] = "ログアウトしました"
	  redirect_to("/login")
	end
end
