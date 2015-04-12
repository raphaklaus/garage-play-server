class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :user, index: true
      t.text :text

      t.timestamps
    end
  end
end
