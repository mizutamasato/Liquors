class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :explanation, null: false
      t.float :rate, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
