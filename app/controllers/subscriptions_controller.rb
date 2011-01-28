class SubscriptionsController < ApplicationController
	def create
		@new_subscription = Subscription.new(params[:subscription])
		if @new_subscription.subscriber_id == session[:current_user_id] && @new_subscription.save
			redirect_to(@new_subscription.publisher, :notice => "You are now subscribed to #{@new_subscription.publisher.name}")
		else
			if User.exists?(params[:subscription][:publisher_id])
				redirect_to(@new_subscription.publisher, :alert => @new_subscription.errors.full_messages.join(';'))
			else
				redirect_to(root_path, :alert => "Nice try.")
			end
		end
	end
end