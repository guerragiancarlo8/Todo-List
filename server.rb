require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require_relative('lib/task.rb')
require_relative('lib/todo.rb')

enable(:sessions)
todo_list = TodoList.new("Josh")

todo_list.add_task(Task.new("Walk the dog"))
todo_list.add_task(Task.new("Buy the milk"))


get '/tasks' do
	@todo_list = todo_list
	erb(:task_index)
end



get '/new_task' do
	erb(:new_task)
end

post '/create_task' do
	todo_list.add_task(Task.new(params["content"]))
	redirect('/tasks')
end

post '/complete_task/:id' do
	todo_list.find_task_by_id(params[:id].to_i).complete!
	redirect('/tasks')
end

post '/delete_task/:id' do
	todo_list.delete_task(params[:id].to_i)
	todo_list.tasks.each {|x| puts x.content}

	redirect('/tasks')
end