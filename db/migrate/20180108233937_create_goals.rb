class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :details
      t.boolean :completed?, default: false
      t.boolean :private?, default: false
      t.timestamps
    end
    add_index :goals, :user_id
  end
end
