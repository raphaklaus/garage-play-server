class CreateCompromises < ActiveRecord::Migration
  def change
    create_table :compromises do |t|
      t.string :title
      t.string :location
      t.datetime :datehour
      t.string :description
      t.integer :periodicity

      t.timestamps
    end
  end
end
