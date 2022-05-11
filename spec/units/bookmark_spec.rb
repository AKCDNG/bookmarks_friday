require "bookmark.rb"

describe "bookmark wrapping" do

  it "returns title of website" do
    expect(subject.title).to eq "Testurl3"
  end
end