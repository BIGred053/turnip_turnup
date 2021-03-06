class CreateIslands < ActiveRecord::Migration[6.0]
  def change
    create_table :islands do |t|
      t.string :name, null: false
      t.references :user, foreign_key: true, null: false, unique: true
      t.string :native_fruit, null: false

      t.timestamps
    end
  end
end
