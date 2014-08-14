class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.column :name, :varchar
      t.column :location, :varchar
      t.column :start_date, :datetime
      t.column :end_date, :datetime

      t.timestamps
    end
  end
end
