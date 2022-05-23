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
end
