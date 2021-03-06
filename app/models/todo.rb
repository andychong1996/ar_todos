require_relative '../../config/application.rb'
class Todo < ActiveRecord::Base

	def self.add_for_seed(task)
		self.create(task: task, complete_status: false)
	end

	def self.list()
		todo_list = self.find_by_sql("SELECT * FROM todos")
		todo_list.each_with_index do |row, row_index|
			if(row.complete_status)
			puts "[X] #{row_index+1}. #{row.task}"
			else
			puts "[ ] #{row_index+1}. #{row.task}"
			end
		end
	end

	def self.add(task)
		puts "Appended '#{task}' to your TODO list"
		self.create(task: task, complete_status: false)
	end

	def self.delete(index_to_delete)
		todo_list = self.find_by_sql("SELECT * FROM todos")
		todo_list.each_with_index do |row, index|
			row_index = index+1
			if row_index == index_to_delete
				puts "Deleted '#{row.task}' from your TODO list"
				self.destroy(row.id)
			end
		end
	end

	def self.mark_completed(index_to_completed)
		todo_list = self.find_by_sql("SELECT * FROM todos")
		todo_list.each_with_index do |row, index|
			row_index = index+1
			if row_index == index_to_completed
				puts "#{row.task} is completed"
				self.update(row.id, complete_status: true)
			end
		end
	end

end
