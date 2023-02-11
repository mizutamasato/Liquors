class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :explanation, null: false

      t.timestamps
    end
  end
end
