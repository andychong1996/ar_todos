require 'faker'
require_relative "../app/models/todo.rb"

class Seeds
	def self.seeding
		10.times do
			Todo.add_for_seed(Faker::Lorem.sentence)						
		end
		puts "Seeding completed"
	end

end
