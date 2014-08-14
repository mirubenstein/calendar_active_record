class CreateToDoAndNotes < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.string
      t.timestamps
    end

    create_table :notes do |t|
      t.string :name
      t.references :noteable, polymorphic: true
      t.timestamps
    end
  end
end
