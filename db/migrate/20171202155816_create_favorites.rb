class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :size_id
      t.integer :top_wood_id
      t.integer :body_wood_id

      t.timestamps null: false
    end
  end
end
