class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_id
      t.integer :user_id
      t.string :job_title
      t.string :job_type
      t.date :start_date
      t.date :end_date
      t.string :location
      t.string :description
      t.integer :position_max
      t.integer :positions_filled
      t.integer :stage
      t.date :closed_date

      t.timestamps
    end
  end
end
