require_relative 'config/application'
require_relative 'app/models/todo.rb'

# puts "Put your application code in #{File.expand_path(__FILE__)}"

case ARGV[0]
when "add"
	Todo.add(ARGV[1..-1].join(" "))
when "list"
	Todo.list
when "delete"
	Todo.delete(ARGV[1].to_i)
when "mark_completed"
	Todo.mark_completed(ARGV[1].to_i)
else
	puts "Opps...here's the commands your can run on this program(run this program again and remember add the command after the file name)"
		puts "key-in add <your task here> to add task"
		puts "key-in list to list out your current task"
		puts "key-in delete <your task index> to delete task"
		puts "key-in mark_completed <your task id> to set task to completed"
end
