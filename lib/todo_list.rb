class TodoList
  def initialize
    @tasks = []
  end

  def add(todo) # todo is an instance of Todo
    @tasks << todo
  end

  def incomplete
    incomplete_tasks = @tasks.select { |task| !task.done? }
    incomplete_tasks.map { |todo| todo.task }
  end

  def complete
    complete_tasks = @tasks.select { |task| task.done? }
    complete_tasks.map { |todo| todo.task }
  end

  def give_up!
    @tasks = @tasks.each { |todo| todo.mark_done! }
  end
end