class AddConsentsToUser < ActiveRecord::Migration
  def change
    add_column :users, :consent1, :boolean, :default => false
    add_column :users, :consent2, :boolean, :default => false
  end
end
