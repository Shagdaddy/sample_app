class FixColNamMessName < ActiveRecord::Migration
  def self.up
    change_table :messages do |t|
      t.rename :user_name, :name
    end
  end

  def self.down
    change_table :messages do |t|
      t.rename :name, :user_name
    end
  end
end
