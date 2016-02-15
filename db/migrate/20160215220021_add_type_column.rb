class AddTypeColumn < ActiveRecord::Migration
  def change
  	add_column :asanas, :type, :string
  end
end
