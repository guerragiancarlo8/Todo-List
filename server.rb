require 'sinatra'
require 'sinatra/reloader'

require_relative('lib/task.rb')
require_relative('lib/todo.rb')

todo_list = TodoList.new("Josh")

todo_list.add_task(Task.new("Walk the dog"))
todo_list.add_task(Task.new("Buy the milk"))



get '/tasks' do
	erb(:task_index)
end