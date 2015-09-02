class AdjustsBandsTableUsingUid < ActiveRecord::Migration
  def change
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
  end
end
