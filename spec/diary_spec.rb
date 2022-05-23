require "diary"

RSpec.describe Diary do
  it "constructs" do
    diary = Diary.new
    expect(diary.all).to eq []
  end

  context "diary is empty" do
    it "counts 0 words" do
      diary = Diary.new
      expect(diary.count_words).to eq 0
    end

    it "returns reading time of 0" do
      diary = Diary.new
      expect(diary.reading_time(20)).to eq 0
    end

    it "returns nil for best entry for reading time" do
      diary = Diary.new
      expect(diary.find_best_entry_for_reading_time(2, 40)).to eq nil
    end
  end
end