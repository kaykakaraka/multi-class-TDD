# 1 - just for Diary
diary = Diary.new
diary.all # => []

# 2 - one diary entry made and shown
diary = Diary.new
entry_1 = DiaryEntry.new("Tuesday", "I walked the dog")
diary.add(entry_1)
diary.all # => [entry_1]

# 3 - another for both
diary = Diary.new
entry_1 = DiaryEntry.new("Tuesday", "I walked the dog")
entry_2 = DiaryEntry.new("Wednesday", "I met a cat")
diary.add(entry_1)
diary.add(entry_2)
diary.all # => [entry_1, entry_2]

# 4 
diary = Diary.new
entry_1 = DiaryEntry.new("Tuesday", "I walked the dog")
entry_1.count_words
diary.add(entry_1)
diary.count_words # => 4

# 5
diary = Diary.new
entry_1 = DiaryEntry.new("Tuesday", "I walked the dog happily down the road")
entry_1.count_words
diary.add(entry_1)
diary.count_words # => 8
