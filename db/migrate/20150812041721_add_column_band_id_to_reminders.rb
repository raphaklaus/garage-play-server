class AddColumnBandIdToReminders < ActiveRecord::Migration
  def change
    add_reference :reminders, :band, index: true
  end
end
