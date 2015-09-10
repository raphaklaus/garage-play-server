require 'elasticsearch/model'
class Band < ActiveRecord::Base
  # belongs_to :user
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include UUIDHelper
  has_many :reminders
  has_many :compromises
  has_and_belongs_to_many :users
  self.primary_key = 'id'
end
