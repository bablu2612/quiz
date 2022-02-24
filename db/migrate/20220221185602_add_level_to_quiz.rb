class AddLevelToQuiz < ActiveRecord::Migration[6.1]
  def change
    add_reference :quizzes, :level, null: false, foreign_key: true
  end
end
