class DropZipcodes < ActiveRecord::Migration[5.0]
  def change
    drop_table :zipcodes
  end
end
