class ChangeZipcodeColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :trips, :zipcode_id, :integer
    add_column :trips, :zipcode, :integer
  end
end
