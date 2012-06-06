class AddFacebookConnectToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_connect, :boolean, :default => false
  end
end
