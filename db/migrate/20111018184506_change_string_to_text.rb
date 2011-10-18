class ChangeStringToText < ActiveRecord::Migration
  def self.up
    change_column :orders, :description, :text
  end

  def self.down
    change_column :orders, :description, :string
  end
end
