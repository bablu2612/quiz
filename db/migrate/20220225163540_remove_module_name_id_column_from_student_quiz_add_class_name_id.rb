class RemoveModuleNameIdColumnFromStudentQuizAddClassNameId < ActiveRecord::Migration[6.1]
  def change
    remove_column :student_quizzes,:module_name_id
    add_reference :student_quizzes,:class_name, null: false, foreign_key: true
  end
end
