class AddColumnNotificationTypeToCompromises < ActiveRecord::Migration
  def change
    add_column :compromises, :email_notification, :boolean, default: false
    add_column :compromises, :sms_notification, :boolean, default: false
    add_column :compromises, :facebook_notification, :boolean, default: false
  end
end
