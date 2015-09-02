class CreateBandRequests < ActiveRecord::Migration
  def change
    create_table :band_requests do |t|
      t.references :band, index: true
      t.references :user, index: true
      t.integer :status

      t.timestamps
    end
  end
end
