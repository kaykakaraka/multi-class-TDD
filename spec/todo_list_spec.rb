require 'todo_list'

RSpec.describe TodoList do

  it "constructs" do
    todo_list = TodoList.new
    expect(todo_list.complete).to eq []
    expect(todo_list.incomplete).to eq []
  end

  it "shows an empty array if give_up! is used on no tasks" do
    todo_list = TodoList.new
    todo_list.give_up!
    expect(todo_list.complete).to eq []
    expect(todo_list.incomplete).to eq []
  end
end