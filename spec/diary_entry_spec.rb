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
end
