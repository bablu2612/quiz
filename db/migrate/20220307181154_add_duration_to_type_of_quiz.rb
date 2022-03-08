class AddDurationToTypeOfQuiz < ActiveRecord::Migration[6.1]
  def change
    add_column :type_of_quizzes, :duration, :integer
  end
end
