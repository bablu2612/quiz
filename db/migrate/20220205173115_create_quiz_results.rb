class CreateQuizResults < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_results do |t|
      t.string :question
      t.string :options
      t.string :submited_ans
      t.string :correct_ans
      t.string :type_id
      t.string :notification_id

      t.timestamps
    end
  end
end
