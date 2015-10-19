require_relative '../../config/application.rb'
class Task < ActiveRecord::Base

	def self.list()
		todo_list = self.find(:all)
		todo_list.each do |row|
			puts "#{row.id}. #{row.task} [#{row.complete_status}]"			
		end
	end

	def self.add(task)
		self.create(task: task, complete_status: false)
	end

	def self.delete(id)
		self.delete(id: id)
	end

	def self.completed(id)
		self.update(id, complete_status: true)
	end

end
