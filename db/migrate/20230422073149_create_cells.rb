class CreateCells < ActiveRecord::Migration[7.0]
  def change
    create_table :cells do |t|
      t.integer :mcc
      t.integer :mnc
      t.integer :lac
      t.integer :cid
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
