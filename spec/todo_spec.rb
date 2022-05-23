require 'todo_list'

RSpec.describe Todo do

  it "constructs" do
    task_1 = Todo.new("Hang out the washing")
    expect(task_1.task).to eq "Hang out the washing"
  end

  it "shows an incomplete task as false" do
    task_1 = Todo.new("Hang out the washing")
    expect(task_1.done?).to eq false
  end

  it "shows a complete task as true" do
    task_1 = Todo.new("Hang out the washing")
    task_1.mark_done!
    expect(task_1.done?).to eq true
  end

  context "task is empty string" do
    it "fails" do
      expect{ task_1 = Todo.new("") }.to raise_error "Error: string is empty"
    end
  end
end