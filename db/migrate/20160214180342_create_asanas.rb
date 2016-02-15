class CreateAsanas < ActiveRecord::Migration
	def change
		create_table :asanas do |table|
			table.string :name
			table.string :translation
			table.string :image
			table.string :details
			table.string :similar_poses
			table.timestamps
		end
	end
end
