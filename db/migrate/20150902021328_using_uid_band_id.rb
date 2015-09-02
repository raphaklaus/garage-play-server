class UsingUidBandId < ActiveRecord::Migration
  def self.up
    create_table :bands, :id => false  do |t|
      # t.uuid :id, :primary_key => true
      t.string :id, limit: 36, null: false
      t.string :name
      t.references :user, index: true
      t.string :city
      t.string :genre

      t.timestamps
    end
    execute "ALTER TABLE bands ADD PRIMARY KEY (id);"

    #changing type on related columns in another tables.
    change_column :compromises, :band_id, :string, {:limit => 36, null: false}
    change_column :reminders, :band_id, :string, {:limit => 36, null: false}
    change_column :bands_users, :band_id, :string, {:limit => 36, null: false}
    change_column :band_requests, :band_id, :string, {:limit => 36, null: false}
  end

  def self.down
	  drop_table :bands
  end
end
