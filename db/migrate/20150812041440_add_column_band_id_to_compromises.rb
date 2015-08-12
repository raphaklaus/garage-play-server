class AddColumnBandIdToCompromises < ActiveRecord::Migration
  def change
    add_reference :compromises, :band, index: true
  end
end
