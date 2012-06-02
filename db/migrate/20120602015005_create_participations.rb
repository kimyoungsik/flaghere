class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :user_id
      t.integer :flag_id
      t.has_attached_file :picture
      t.text :note
      t.timestamps
    end
  end
end
