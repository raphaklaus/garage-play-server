class AdjustsBandsTableUsingUidRelatedTables < ActiveRecord::Migration
  def change
    #changing type on related columns in another tables.
    change_column :compromises, :band_id, :string, limit: 36, null: false
    change_column :reminders, :band_id, :string, limit: 36, null: false
    change_column :bands_users, :band_id, :string, limit: 36, null: false
    change_column :band_requests, :band_id, :string, limit: 36, null: false  	
  end
end
