class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.references :user, index: true
      t.string :title
      t.string :completed
      t.timestamps null: false
    end
  end
end
