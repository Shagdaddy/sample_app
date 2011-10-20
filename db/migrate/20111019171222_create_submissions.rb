class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.integer :order_id
      t.integer :candidate_id
      t.integer :stage
      t.text :comments
      t.boolean :hide_name

      t.timestamps
    end
  end

  def self.down
    drop_table :submissions
  end

end
