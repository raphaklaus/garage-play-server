class Contact < ActiveRecord::Base
attr_accessor :email, :user_name
  belongs_to :user
end
