class ChangeColumnOfQuestions < ActiveRecord::Migration[6.1]
  def change
    change_column :questions, :options, :text
  end
end
