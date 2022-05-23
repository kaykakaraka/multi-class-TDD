class Todo
  def initialize(task) # task is a string
    fail "Error: string is empty" if task.empty? 
    @task = task
    @status = false
  end

  def task
    @task
  end

  def mark_done!
    @status = true
    # Returns nothing
  end

  def done?
    @status
    # Returns true if the task is done
    # Otherwise, false
  end
end