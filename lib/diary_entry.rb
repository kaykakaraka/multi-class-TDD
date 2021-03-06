class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @begin_from = 0
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split(" ").count
  end

  def reading_time(wpm)  # gives the time in minutes to read the entry 
    (count_words.to_f / wpm).round
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
    @begin_from = 0 if @begin_from >= count_words 

    end_at = @begin_from + (wpm * minutes - 1) #calculates where to end reading
    chunk_to_read = @contents.split(" ")[@begin_from..(end_at)].join(" ")   #extracts the chunk of text 
                          
    @begin_from += chunk_to_read.split(" ").count
    
    chunk_to_read                  
  end
end

