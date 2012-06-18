class AddHikingToInfo < ActiveRecord::Migration
  def change
    add_column :hikings, :hikingtype_id, :integer
    add_column :hikings, :course, :string
    add_column :hikings, :level, :integer
    add_column :hikings, :hour, :time
    add_column :hikings, :day, :string
    add_column :hikings, :call, :string    
  end
end
