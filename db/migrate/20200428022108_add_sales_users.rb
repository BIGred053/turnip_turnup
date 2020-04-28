class AddSalesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :sales_users do |t|
      t.references :sale, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end

    add_index :sales_users, %i[sale_id user_id], unique: true
  end
end
