class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.string :description
      t.has_attached_file :badgephoto
      
      t.timestamps
    end
  end
end
