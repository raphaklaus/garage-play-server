class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
