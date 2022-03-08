class AddExplanationToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :explanation, :text
  end
end
