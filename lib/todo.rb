require 'date'
require 'rspec'
require_relative 'task.rb'

class TodoList
	attr_reader :tasks, :user
	def initialize user
    
    @user = user
		@tasks = []
	end

	def add_task task

		@tasks.push(task)
		true
	end

	def delete_task task_id

    @tasks.each do |x|
      if x.id == task_id.to_i
        @tasks.delete(x)
      end
    end
    true
	end

  def find_task_by_id search_id
    @tasks.find{|item| item.id == search_id}
    
  end

  def save
    @todo_store.transaction do
      @todo_store[@user] = @tasks
    end
  end
end



