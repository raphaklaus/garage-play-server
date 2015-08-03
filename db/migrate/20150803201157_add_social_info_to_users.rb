class AddSocialInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :social_id, :string
    add_column :users, :social_type, :integer
  end
end
