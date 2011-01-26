class Subscription < ActiveRecord::Base
	belongs_to :subscriber, :class_name => "User", :foreign_key => "subscriber_id"
	belongs_to :publisher, :class_name => "User"
	validates_presence_of :subscriber, :publisher
	validates_uniqueness_of :subscriber_id, :scope => [:publisher_id]
	def validate
		if subscriber_id == publisher_id
			errors.add_to_base "Subscriber cannot be the same as publisher!"
		end
	end
end