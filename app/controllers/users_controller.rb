class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create

		@user = User.new(params[:user])
		if @user.save!
			redirect_to login_path
		else
			flash.now[:creation]
			render :new
		end
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to user_path(@user)
		else
			render :edit
		end
	end
	def index
		@users = User.all
	end
	def show
		@user = User.find(params[:id])
	end
	def destroy
		@user = User.find(params[:id])
		@user.destroy
	end
end