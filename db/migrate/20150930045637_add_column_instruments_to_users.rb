class AddColumnInstrumentsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :instruments, :string
  end
end
