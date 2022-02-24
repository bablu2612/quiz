class CreateLevels < ActiveRecord::Migration[6.1]
  def change
    create_table :levels do |t|
      t.string :name
      t.references :module_name, null: false, foreign_key: true

      t.timestamps
    end
  end
end
