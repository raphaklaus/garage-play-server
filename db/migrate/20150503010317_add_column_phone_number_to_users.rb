class AddColumnPhoneNumberToUsers < ActiveRecord::Migration
  def change
	add_column :users, :phone_number, :string, :limit => 16 
  end
end
