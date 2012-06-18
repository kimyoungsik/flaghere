class CreateHikingtypes < ActiveRecord::Migration
  def change
    create_table :hikingtypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
