class AddValueToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile, :text
    add_column :users, :age, :integer, :default => 0
    add_column :users, :hobby, :text
  end
end
