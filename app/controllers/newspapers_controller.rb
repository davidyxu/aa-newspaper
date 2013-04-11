class NewspapersController < ApplicationController
	def new
		@newspaper = Newspaper.new
		3.times { @newspaper.subscription_plans.build }
	end
	def create
		@newspaper = Newspaper.new(params[:newspaper])
		@newspaper.save!
		if @newspaper.save
			redirect_to newspaper_path(@newspaper)
		else
			render :new
		end
	end
	def edit
		@newspaper = Newspaper.find(params[:id])
	end
	def update
		@newspaper = Newspaper.find(params[:id])
		if @newspaper.update_attributes(params[:newspaper])
			redirect_to newspaper_path(@newspaper)
		else
			render :edit
		end
	end
	def index
		@newspapers = Newspaper

		@newspapers = @newspapers.all
	end
	def show
		@newspaper = Newspaper.find(params[:id])
	end

	def destroy
		@newspaper = Newspaper.find(params[:id])
		@newspaper.destroy
		redirect_to newspapers_path
	end
end
