require 'date'
require 'rspec'

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

    @tasks.delete_if {|x| x == task_id.to_i}
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




#todo_list.load_tasks
#puts todo_list.tasks.length
