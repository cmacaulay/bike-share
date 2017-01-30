class ChangeBikeTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :bikes, :name, :string
    add_column    :bikes, :given_id, :integer
  end
end
