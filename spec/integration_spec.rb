require "diary"
require "diary_entry"

RSpec.describe "integration" do

  context "when one diary entry is added to diary" do
    it "shows the entry" do
     diary = Diary.new
     entry_1 = DiaryEntry.new("Tuesday", "I walked the dog")
     diary.add(entry_1)
     expect(diary.all).to eq [entry_1]
    end

    it "counts the words in contents" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Tuesday", "I walked the dog")
      diary.add(entry_1)
      expect(diary.count_words).to eq 4
    end

    it "counts the words in contents when it is longer" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Tuesday", "I walked the dog happily down the road")
      entry_1.count_words
      diary.add(entry_1)
      expect(diary.count_words).to eq 8
    end

    it "gives the number of minutes needed to read the entry" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Thursday", "I went for a lovely swim at the park")
      diary.add(entry_1)
      expect(diary.reading_time(1)).to eq 9
    end

    it "gives the number of minutes needed to read a longer entry" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Thursday", "contents " * 900)
      diary.add(entry_1)
      expect(diary.reading_time(50)).to eq 18
    end
  end

  context "When two diary entries are added to diary" do
    it "shows both" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Tuesday", "I walked the dog")
      entry_2 = DiaryEntry.new("Wednesday", "I met a cat")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.all).to eq [entry_1, entry_2]
    end

    it "counts the words for both" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Tuesday", "I walked the dog")
      entry_2 = DiaryEntry.new("Wednesday", "I met a cat")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.count_words).to eq 8
    end

    it "gives the number of minutes needed to read both entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Thursday", "contents " * 900)
      entry_2 = DiaryEntry.new("Friday", "contents " * 800)
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.reading_time(50)).to eq 34
    end
  end

  context "both diary entries could be read by the user in time" do
    it "selects the diary entry that is closest to the length they can read" do
      diary = Diary.new
      diary = Diary.new
      entry_1 = DiaryEntry.new("Thursday", "contents " * 900)
      entry_2 = DiaryEntry.new("Friday", "contents " * 800)
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.find_best_entry_for_reading_time(50, 20)).to eq entry_1
    end

    it "selects a different diary entry that is closest to the length they can read" do
      diary = Diary.new
      diary = Diary.new
      entry_1 = DiaryEntry.new("Thursday", "contents " * 50)
      entry_2 = DiaryEntry.new("Friday", "contents " * 800)
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.find_best_entry_for_reading_time(50, 20)).to eq entry_2
    end
  end

  context "one diary entry is too long for the user to read" do
    it "returns the entry the user has time to read" do
      diary = Diary.new
      diary = Diary.new
      entry_1 = DiaryEntry.new("Thursday", "I walked the dog")
      entry_2 = DiaryEntry.new("Friday", "I was walking the dog very happily today")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.find_best_entry_for_reading_time(4, 1)).to eq entry_1
    end
  end
end