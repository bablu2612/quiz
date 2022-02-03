class ChangeDescriptionToRichText < ActiveRecord::Migration[6.1]
  def change
    change_column :type_of_quizzes, :description, :rich_text
    change_column :quizzes, :description, :rich_text
  end
end
