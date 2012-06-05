class CreateHikings < ActiveRecord::Migration
  def change
    create_table :hikings do |t|
      t.integer :user_id
      t.integer :province_id
      t.string :name
      t.datetime :datetime
      t.string :location
      t.text :description
      t.integer :limit
      t.integer :money
     
      t.has_attached_file :hikingphoto
      
      t.timestamps
    end
  end
end
