class UsersController < ApplicationController
	before_action :set_user, only: %i[edit update show]
	def new
		@user = User.new
	end

	def show; end

	def index
		@users = User.all
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] =
				"Welcome to the Alfa Blog #{@user.username}, you have successfully siged up"
			redirect_to articles_path
		else
			render 'new'
		end
	end

	def edit; end

	def update
		if @user.update(user_params)
			flash[:notice] = 'your account information was updated succesfully'
			redirect_to user_path(@user)
		else
			render 'edit'
		end
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

	def set_user
		@user = User.find(params[:id])
	end
end
