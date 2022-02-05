class CreateImageUploads < ActiveRecord::Migration[6.1]
  def change
    create_table :image_uploads do |t|
      t.string :name

      t.timestamps
    end
  end
end
