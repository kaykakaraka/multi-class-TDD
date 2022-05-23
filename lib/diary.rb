class Diary
  def initialize
    @DiaryEntries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    @DiaryEntries << entry
    # Returns nothing
  end

  def all
    @DiaryEntries
    # Returns a list of instances of DiaryEntry
  end

  def count_words
    counter = 0
    return counter if @DiaryEntries.empty?
    @DiaryEntries.each do |entry|
      counter += entry.count_words
    end
    counter
    # Returns total number of words in all entries
  end

  def reading_time(wpm) #returns in minutes how long it would take to read all entries
    count_words / wpm                 
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    words_to_read = wpm * minutes
    entries = @DiaryEntries
    entries.select! { |entry| entry.count_words <= words_to_read }
    entries.max_by { |entry| entry.count_words }
    # Returns the entry closest to the length they can read in the given time
    # that they can complete in the given time
  end
end
