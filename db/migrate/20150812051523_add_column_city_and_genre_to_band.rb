class AddColumnCityAndGenreToBand < ActiveRecord::Migration
  def change
    add_column :bands, :city, :string
    add_column :bands, :genre, :string
  end
end
