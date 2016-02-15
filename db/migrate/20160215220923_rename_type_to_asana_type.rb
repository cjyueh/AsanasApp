class RenameTypeToAsanaType < ActiveRecord::Migration
  def change
  	rename_column :asanas, :type, :asana_type
  end
end
