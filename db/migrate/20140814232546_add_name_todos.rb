class AddNameTodos < ActiveRecord::Migration
  def change
    add_column :to_dos, :name, :varchar
  end
end
