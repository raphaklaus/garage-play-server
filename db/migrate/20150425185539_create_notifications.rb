class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :compromise, index: true
      t.integer :notification_type
      t.datetime :send_date
      t.boolean :sent, default: false

      t.timestamps
    end
  end
end
