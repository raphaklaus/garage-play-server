class RemoveColumnNameFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :name
    remove_column :users, :email
  end
end
