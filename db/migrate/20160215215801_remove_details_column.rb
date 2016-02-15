class RemoveDetailsColumn < ActiveRecord::Migration
  def change
  	remove_column :asanas, :details
  end
end
