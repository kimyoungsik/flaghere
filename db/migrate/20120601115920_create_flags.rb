class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.integer :user_id
      t.integer :province_id
      t.string :name
      t.date :date
      t.string :location
      t.text :description
      t.has_attached_file :photo

      t.timestamps
    end
  end
end
