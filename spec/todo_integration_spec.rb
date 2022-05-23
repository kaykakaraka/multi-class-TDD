require 'todo_list'
require 'todo'

RSpec.describe "integration" do

  context "when task is added to todo list" do
    it "returns task as incomplete" do
      todo_list = TodoList.new
      task_1 = Todo.new("Hang out the washing")
      todo_list.add(task_1)
      expect(todo_list.incomplete).to eq ["Hang out the washing"]
    end

    it "shows complete list as empty" do
      todo_list = TodoList.new
      task_1 = Todo.new("Hang out the washing")
      todo_list.add(task_1)
      expect(todo_list.complete).to eq []
    end
  end

  context "when task is completed" do
    it "returns task as complete" do
      todo_list = TodoList.new
      task_1 = Todo.new("Hang out the washing")
      todo_list.add(task_1)
      task_1.mark_done!
      expect(todo_list.complete).to eq ["Hang out the washing"]
    end
  end

  context "when multiple incomplete tasks on todo list" do
    it "returns both" do
      todo_list = TodoList.new
      task_1 = Todo.new("Hang out the washing")
      task_2 = Todo.new("Eat an apple")
      todo_list.add(task_1)
      todo_list.add(task_2)
      expect(todo_list.incomplete).to eq ["Hang out the washing", "Eat an apple"]
    end
  end

  context "when 1 task has been added and completed" do
    it "shows the incomplete list as empty" do
      todo_list = TodoList.new 
      task_1 = Todo.new("Hang out the washing")
      todo_list.add(task_1)
      task_1.mark_done!
      expect(todo_list.incomplete).to eq []
    end
  end

  context "when multiple tasks have been added and completed" do
    it "shows both on the complete list" do
      todo_list = TodoList.new
      task_1 = Todo.new("Hang out the washing")
      task_2 = Todo.new("Eat an apple")
      todo_list.add(task_1)
      todo_list.add(task_2)
      task_1.mark_done!
      task_2.mark_done!
      expect(todo_list.complete).to eq ["Hang out the washing", "Eat an apple"]
    end
  end

  context "when user uses give_up! on two tasks" do
    it "has an empty incomplete list" do
      todo_list = TodoList.new
      task_1 = Todo.new("Hang out the washing")
      task_2 = Todo.new("Eat an apple")
      todo_list.add(task_1)
      todo_list.add(task_2)
      todo_list.give_up!
      expect(todo_list.incomplete).to eq []
    end

    it "has both tasks in the complete list" do
      todo_list = TodoList.new
      task_1 = Todo.new("Hang out the washing")
      task_2 = Todo.new("Eat an apple")
      todo_list.add(task_1)
      todo_list.add(task_2)
      todo_list.give_up!
      expect(todo_list.complete).to eq ["Hang out the washing", "Eat an apple"]
    end
  end
end