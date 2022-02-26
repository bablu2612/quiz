class ChangeColumnQuizIdToLevelIdOfStudentQuiz < ActiveRecord::Migration[6.1]
  def change
    remove_column :student_quizzes,:quiz_id
    add_reference :student_quizzes,:module_name, null: false, foreign_key: true
  end
end
