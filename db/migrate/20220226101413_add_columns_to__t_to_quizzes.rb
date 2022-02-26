class AddColumnsToTToQuizzes < ActiveRecord::Migration[6.1]
  def change
    add_column :quizzes, :active, :boolean
  end
end
