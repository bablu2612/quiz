class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :descriptions

      t.timestamps
    end
  end
end
