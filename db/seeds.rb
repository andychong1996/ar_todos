require 'faker'
require_relative "../app/models/todo.rb"

class Seeds
	def self.seeding
		10.times do
			Todo.add(Faker::Lorem.sentence)
						
		end
	end

end
