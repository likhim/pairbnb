class ChangeIntegerLimitForUsers < ActiveRecord::Migration
  def change
  	change_column :users, :phone_num, :integer, limit: 8
  end
end
