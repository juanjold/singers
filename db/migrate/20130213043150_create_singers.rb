class CreateSingers < ActiveRecord::Migration
  def change
    create_table :singers do |t|
      t.string :name
      t.string :lastname
      t.string :voicepart
      t.text :skills
      t.text :bio
      t.string :email
      t.string :number
      t.integer :points
      t.integer :id
      t.integer :year

      t.timestamps
    end
  end
end
