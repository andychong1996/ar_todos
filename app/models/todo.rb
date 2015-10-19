require_relative '../../config/application.rb'
class Todo < ActiveRecord::Base

	def self.list()
		todo_list = self.find_by_sql("SELECT * FROM todos")
		todo_list.each_with_index do |row, row_index|
			if(row.complete_status)
			puts "[X] #{row_index+1}. #{row.task} |DB_id: #{row.id}|"
			else
			puts "[ ] #{row_index+1}. #{row.task} |DB_id: #{row.id}|"
			end
		end
		# self.each do |row|
		# 	puts "#{row.index}. #{row.task} [#{row.complete_status}]"
		# end

	end

	def self.add(task)
		puts "Appended '#{task}' to your TODO list"
		self.create(task: task, complete_status: false)
	end

	def self.delete(id)
		task = self.find(id)
		puts "Deleted #{task.task} from your TODO list"
		self.destroy(id)
	end

	def self.mark_completed(id)
		self.update(id, complete_status: true)
	end

end
