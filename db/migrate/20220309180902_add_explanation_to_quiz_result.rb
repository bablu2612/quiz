class AddExplanationToQuizResult < ActiveRecord::Migration[6.1]
  def change
    add_column :quiz_results, :explanation, :text
  end
end
