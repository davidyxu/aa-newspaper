class SubscriptionPlansController < ApplicationController
	def new
		@subscription_plan = SubscriptionPlan.new
		@id = params[:id]
	end
	def create
		@subscription_plan = SubscriptionPlan.new(params[:subscription_plan])
		@id = params[:subscription_plan][:newspaper_id]
		if @subscription_plan.save
			if params[:id].nil?
				redirect_to newspapers_path
			else
				redirect_to newspaper_path(params[:id])
			end
		else
			render :new
		end
	end
	def edit
	end
	def update
	end

	def destroy
		@subscription_plan = SubscriptionPlan.find(params[:id])
		@subscription_plan.destroy
		redirect_to newspaper_path(@subscription_plan.newspaper_id)
	end

	def show
		@subscription_plan = SubscriptionPlan.includes(:newspaper).find(params[:id])
	end

end
