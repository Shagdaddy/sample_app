class FixColumnName < ActiveRecord::Migration

  def self.up
    change_table :messages do |t|
      t.rename :user_name, :name
      t.rename :email_addr, :email
    end
  end

  def self.down
    change_table :messages do |t|
      t.rename :name, :user_name
      t.rename :eamil, :email_addr
    end
  end


#  def self.up
#    rename_column :messages, :user_name, :name	
#    rename_column :messages, :email_addr, :email
#  end

#  def self.down
#    rename_column :messages, :name, :user_name		
#    rename_column :messages, :email, :email_addr
#  end

end
