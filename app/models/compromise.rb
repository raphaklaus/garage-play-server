class Compromise < ActiveRecord::Base
	has_many :notifications, :dependent => :delete_all
end
