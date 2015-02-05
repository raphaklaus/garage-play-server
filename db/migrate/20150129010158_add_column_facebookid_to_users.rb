class AddColumnFacebookidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_id, :string
    add_column :users, :name, :string
  end
end
