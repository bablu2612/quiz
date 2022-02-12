class AddUserIdToNotification < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :user_id, :string
    add_column :notifications, :type_id, :string

  end
end
