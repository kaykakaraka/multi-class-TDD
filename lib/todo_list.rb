class TodoList
  def initialize
    @incomplete_tasks = []
    @complete_tasks = []
  end

  def add(todo) # todo is an instance of Todo
    @incomplete_tasks << todo
  end

  def incomplete
    @incomplete_tasks
  end

  def complete
    @complete_tasks
  end

  def give_up!
    # Marks all todos as complete
  end
end