class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :todo_title
      t.string :todo_text

      t.timestamps
    end
  end
end
