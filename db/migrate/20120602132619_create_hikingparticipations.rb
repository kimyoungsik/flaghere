class CreateHikingparticipations < ActiveRecord::Migration
  def change
    create_table :hikingparticipations do |t|
      t.integer :user_id
      t.integer :hiking_id

      t.timestamps
    end
  end
end
