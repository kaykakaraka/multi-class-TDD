# 1 - shows an incomplete task on the todo list
todo_list = TodoList.new
task_1 = Todo.new("Hang out the washing")
todo_list.add(task_1)
todo_list.incomplete # => ["Hang out the washing"]

# 2 - shows a complete task on the todo list
todo_list = TodoList.new
task_1 = Todo.new("Hang out the washing")
todo_list.add(task_1)
task_1.mark_done!
todo_list.complete # => ["Hang out the washing"]
