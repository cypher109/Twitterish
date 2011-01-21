class User < ActiveRecord::Base
	validates_presence_of :name
	has_many :messages, :order => "created_at DESC"
	has_many :subscriptions, :foreign_key => "subscriber_id"
	has_many :published_subscriptions, :class_name => "Subscription", :foreign_key => "publisher_id"
end
