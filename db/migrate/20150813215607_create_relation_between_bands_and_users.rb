class CreateRelationBetweenBandsAndUsers < ActiveRecord::Migration
  def change
    create_table :bands_users do |t|
    	t.references :band, :user
    end
  end
end
