class AddFieldToModel < ActiveRecord::Migration
  def change
    add_column :singers, :status, :string
  end
end
