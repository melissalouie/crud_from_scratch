class AddFieldsToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :status, :text
    add_column :updates, :user, :string
    add_column :updates, :likes, :integer
  end
end
