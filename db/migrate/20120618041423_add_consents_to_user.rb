class AddConsentsToUser < ActiveRecord::Migration
  def change
    add_column :users, :consent1, :boolean, :default => false
    add_column :users, :consent2, :boolean, :default => false
    add_column :users, :name_consent, :boolean, :default => false
    add_column :users, :email_consent, :boolean, :default => false
    add_column :users, :info_consent, :boolean, :default => false
    add_column :users, :nickname, :string
    add_column :users, :favorite_mountain, :string
    add_column :users, :introduce, :string
    add_column :users, :experience, :string

  end
end
