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

# 3 - shows the incomplete list as empty when the tasks have been completed
todo_list = TodoList.new
task_1 = Todo.new("Hang out the washing")
todo.list.add(task_1)
task_1.mark_done!
todo_list.complete # => []

# 4 - shows multiple incomplete tasks on the todo list
todo_list = TodoList.new
task_1 = Todo.new("Hang out the washing")
task_2 = Todo.new("Eat an apple")
todo_list.add(task_1)
todo_list.add(task_2)
todo_list.incomplete # => ["Hang out the washing", "Eat an apple"]

# 5 - shows multiple complete tasks on the todo list
todo_list = TodoList.new
task_1 = Todo.new("Hang out the washing")
task_2 = Todo.new("Eat an apple")
todo_list.add(task_1)
todo_list.add(task_2)
task_1.mark_done!
task_2.mark_done!
todo_list.complete # => ["Hang out the washing", "Eat an apple"]