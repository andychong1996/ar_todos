require 'faker'
require_relative '../../models/task.rb'

class Seeds
	def self.seeding
		10.times do
			Task.add(Faker::Lorem.sentence)
						
		end
	end

end
