class AddColumnsToNotificationQuizTable < ActiveRecord::Migration[6.1]
  def change
    add_column :quizzes, :active, :boolean
    add_column :notifications, :readed, :boolean
  end
end
