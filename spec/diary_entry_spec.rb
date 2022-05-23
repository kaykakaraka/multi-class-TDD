require "diary_entry"

RSpec.describe DiaryEntry do
  it "constructs" do
    entry_1 = DiaryEntry.new("Tuesday", "I walked the dog")
    expect(entry_1.title).to eq "Tuesday"
    expect(entry_1.contents).to eq "I walked the dog"
  end

  it "counts the numbers of words in contents" do
    entry_1 = DiaryEntry.new("Tuesday", "I walked the dog")
    expect(entry_1.count_words).to eq 4
  end

  it "counts a longer contents accurately" do
    entry_1 = DiaryEntry.new("Wednesday", "It was a lovely sunny day. The walk was very nice with the dog.")
    expect(entry_1.count_words).to eq 14
  end

  it "calculates the reading time for the contents" do
    entry_1 = DiaryEntry.new("Wednesday", "It was a lovely sunny day. The walk was very nice with the dog.")
    entry_2 = DiaryEntry.new("Thursday", "contents " * 500)
    expect(entry_1.reading_time(1)).to eq 14
    expect(entry_1.reading_time(2)).to eq 7
    expect(entry_2.reading_time(10)).to eq 50
  end

  context "number of words to read is not divisible by the wpm" do
    it "returns a rounded estimate of reading time" do
      diary_entry = DiaryEntry.new("The fifth of June", "content " * 388)
      result = diary_entry.reading_time(50)
      expect(result).to eq 8
    end
  end

  context "reader has time to read the whole entry" do
    it "returns the whole entry" do
      diary_entry = DiaryEntry.new("The sixth of June", "content " * 4)
      result = diary_entry.reading_chunk(1, 4)
      expect(result).to eq ("content content content content")
    end
  end

  context "reader does not have time to read the whole text" do 
    it "returns a chunk of text that the reader could read in a given time" do
      diary_entry = DiaryEntry.new("The sixth of June", "content " * 8000)
      result = diary_entry.reading_chunk(1, 4)
      expect(result).to eq ("content content content content")
    end

    it "returns the next chunk of text that the reader could read in a given time when asked twice" do
      diary_entry = DiaryEntry.new("The sixth of June", "I absolutely love reading. It is such a pleasure!!")
      first_read = diary_entry.reading_chunk(1, 4)
      result = diary_entry.reading_chunk(1,5)
      expect(result).to eq ("It is such a pleasure!!")
    end

    it "returns to the beginning of the text if the reader has read exactly to the end" do
      diary_entry = DiaryEntry.new("The sixth of June", "I absolutely love reading. It is such a pleasure!!")
      first_read = diary_entry.reading_chunk(1, 4)
      second_read = diary_entry.reading_chunk(1, 5)
      result = diary_entry.reading_chunk(1, 3)
      expect(result).to eq "I absolutely love"
    end

    it "stops at the end of the text even if reader has more time to read" do
      diary_entry = DiaryEntry.new("The seventh of June", "I absolutely love reading. It is such a pleasure!!")
      first_read = diary_entry.reading_chunk(1, 4)
      result = diary_entry.reading_chunk(20, 5)
      expect(result).to eq "It is such a pleasure!!"
    end

    it "correctly counts the words" do 
      diary_entry = DiaryEntry.new("The seventh of June", "I absolutely love reading. It is such a pleasure!!")
      first_read = diary_entry.reading_chunk(1, 8)
      result = diary_entry.reading_chunk(20, 5)
      expect(first_read).to eq "I absolutely love reading. It is such a"
      expect(result).to eq "pleasure!!"
    end

  end

end
