require 'digest/sha1'
class User < ActiveRecord::Base
	validates_presence_of :name
	has_many :messages, :order => "created_at DESC"
	has_many :subscriptions, :foreign_key => "subscriber_id"
	has_many :published_subscriptions, :class_name => "Subscription", :foreign_key => "publisher_id"
  
  def self.authenticate( options = {} )
    User.first(:conditions => {
      :email => options[:email], 
      :password => Digest::SHA1.hexdigest(options[:password])
    })
  end
end
