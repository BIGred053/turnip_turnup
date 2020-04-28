class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.references :island, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.integer :sale_price, null: false
      t.string :dodo_code, null: false, limit: 5
      t.bigint :active_visitor_id

      t.timestamps
    end
  end
end
