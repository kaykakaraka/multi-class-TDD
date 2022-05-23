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
  end

  
 
end