class AddSizeIdToUkulele < ActiveRecord::Migration
  def change
    add_column :ukuleles, :size_id, :integer
  end
end
