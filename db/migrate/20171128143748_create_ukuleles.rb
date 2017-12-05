class CreateUkuleles < ActiveRecord::Migration
  def change
    create_table :ukuleles do |t|
      t.string :model
      t.text :content
      t.string :image

      t.timestamps null: false
    end
  end
end
