class Band < ActiveRecord::Base
  # belongs_to :user
  has_many :reminders
  has_many :compromises
  has_and_belongs_to_many :users
end
