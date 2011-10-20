class AddDeltaToSubmissions < ActiveRecord::Migration
  def self.up
    add_column :submissions, :delta, :integer
  end

  def self.down
    remove_column :submissions
  end

end
