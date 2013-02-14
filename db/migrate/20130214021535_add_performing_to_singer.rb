class AddPerformingToSinger < ActiveRecord::Migration
  def change
    add_column :singers, :performing, :boolean
  end
end
