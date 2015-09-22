class AdjustsBandsTableUsingUidAndRelatedTables < ActiveRecord::Migration
  def change
  #do not drop here.. It will cause problems after this migration...
	drop_table :bands

    create_table :bands, :id => false  do |t|
      # t.uuid :id, :primary_key => true
      t.string :id, limit: 36, primary: true, null: false
      t.string :name
      t.references :user, index: true
      t.string :city
      t.string :genre

      t.timestamps
    end
    
    #changing type on related columns in another tables.
    change_column :compromises, :band_id, :string, :limit => 36
    change_column :reminders, :band_id, :string, :limit => 36
    change_column :bands_users, :band_id, :string, :limit => 36
    change_column :band_requests, :band_id, :string, :limit => 36        	
  end
end
