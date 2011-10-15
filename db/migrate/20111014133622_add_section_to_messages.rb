class AddSectionToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :section, :string
  end

  def self.down
    remove_column :messages, :section
  end

#Below is what was originally generated
#  def change
#    add_column :messages, :section, :string
#  end
end
