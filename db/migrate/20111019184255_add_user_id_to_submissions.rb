class AddUserIdToSubmissions < ActiveRecord::Migration
  def self.up
    add_column :submissions, :user_id, :integer
  end

  def self.down
    remove_column :submissions
  end

end
