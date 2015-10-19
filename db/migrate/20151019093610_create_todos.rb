
class CreateTodos < ActiveRecord::Migration
	def change
		create_table(:todos) do |t|
			t.string :task
			t.boolean :complete_status
		end
	end
end
