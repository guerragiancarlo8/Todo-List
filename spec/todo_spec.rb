require 'yaml'

require_relative '../lib/todo.rb'

RSpec.describe TodoList do 
	before :each do
    @todolist = TodoList.new("Giancarlo")
  end

  describe '#add_task' do
    it "adding the task was succesfull" do
      expect(@todolist.add_task(Task.new("content"))).to eq(true)
      expect((@todolist.tasks.find { |item| item.id == 1}).class).to eq(Task)
    end
  end

  describe "#find_task_by_id" do
    it "Retrieves a task from tasks list by its unique ID" do
      task = Task.new("cont")
      @todolist.add_task(task)
      expect(@todolist.find_task_by_id(task.id).class).to eq(Task)
      expect(@todolist.find_task_by_id(100).class).to eq(NilClass)
    end
  end

  describe '#delete_task' do
    it "Deletes the Task" do
      expect(@todolist.delete_task(1)).to eq(true)
      expect((@todolist.tasks.find { |item| item.id == 1}).class).to eq(NilClass)
    end
  end

  describe '#sort_by_created' do
    it "Sorts by created_at attribute" do
      task1 = Task.new("cont")
      task1.created_at = Date.today.prev_day - 1

      task2 = Task.new("cont2")
      task2.created_at = Date.today.prev_day - 3

      task3 = Task.new("cont3")
      task3.created_at = Date.today.prev_day + 1

      @todolist.add_task(task1)
      @todolist.add_task(task2)
      @todolist.add_task(task3)

      expect(@todolist.tasks.sort!{ |t1, t2| t1.created_at <=> t2.created_at}).to eq([task2,task1,task3])
    end
  end

=begin
  describe '#load_tasks' do
    it "Loads the list from yml file" do
      contents = YAML.load_file('./public/tasks.yml')
      @todolist.add_task(contents)
      expect(@todolist.tasks.length).to eq(3)
    end
  end
=end

end

