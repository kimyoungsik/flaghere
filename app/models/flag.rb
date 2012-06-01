class Flag < ActiveRecord::Base
  attr_accessible :date, :description, :location, :name, :province_id, :user_id
end
