class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.integer :user_id
      t.integer :province_id
      t.string :name
      t.date :date
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
