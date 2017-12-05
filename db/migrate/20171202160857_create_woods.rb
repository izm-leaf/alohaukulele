class CreateWoods < ActiveRecord::Migration
  def change
    create_table :woods do |t|
      t.string :wood

      t.timestamps null: false
    end
  end
end
