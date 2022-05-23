require 'todo_list'
require 'todo'

RSpec.describe "integration" do

  context "task is added to todo list" do
    it "returns task as incomplete" do
      todo_list = TodoList.new
      task_1 = Todo.new("Hang out the washing")
      todo_list.add(task_1)
      expect(todo_list.incomplete).to eq [task_1]
    end
  end

  context "task is completed" do
    xit "returns task as complete" do
      todo_list = TodoList.new
      task_1 = Todo.new("Hang out the washing")
      todo_list.add(task_1)
      task_1.mark_done!
      expect(todo_list.complete).to eq [task_1]
    end
  end

  context "multiple incomplete tasks on todo list" do
    it "returns both" do
      todo_list = TodoList.new
      task_1 = Todo.new("Hang out the washing")
      task_2 = Todo.new("Eat an apple")
      todo_list.add(task_1)
      todo_list.add(task_2)
      expect(todo_list.incomplete).to eq [task_1, task_2]
    end
  end

end