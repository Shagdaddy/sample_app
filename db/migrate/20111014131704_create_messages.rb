class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :email_addr
      t.string :user_name
      t.boolean :confirm_send

      t.timestamps
    end
  end
end
