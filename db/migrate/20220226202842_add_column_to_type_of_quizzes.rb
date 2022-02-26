class AddColumnToTypeOfQuizzes < ActiveRecord::Migration[6.1]
  def change
    add_column :type_of_quizzes, :name, :string
  end
end
