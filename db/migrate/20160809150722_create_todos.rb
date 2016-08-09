class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.boolean :completed
      t.integer :order
      t.string :category
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
