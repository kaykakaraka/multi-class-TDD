require "diary"

RSpec.describe Diary do
  it "constructs" do
    diary = Diary.new
    expect(diary.all).to eq []
  end
end