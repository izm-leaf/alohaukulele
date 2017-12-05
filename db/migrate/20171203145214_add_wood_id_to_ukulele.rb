class AddWoodIdToUkulele < ActiveRecord::Migration
  def change
    add_column :ukuleles, :wood_id, :integer
  end
end
