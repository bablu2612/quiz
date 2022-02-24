class RemoveColumnActiveFromQuizzes < ActiveRecord::Migration[6.1]
  def change
    remove_column :quizzes, :active
  end
end
