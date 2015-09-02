class Band < ActiveRecord::Base
  # belongs_to :user
  include UUIDHelper
  has_many :reminders
  has_many :compromises
  has_and_belongs_to_many :users
  self.primary_key = 'id'
end
