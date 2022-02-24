class CreateModuleNames < ActiveRecord::Migration[6.1]
  def change
    create_table :module_names do |t|
      t.string :name
      t.references :class_name, null: false, foreign_key: true

      t.timestamps
    end
  end
end
