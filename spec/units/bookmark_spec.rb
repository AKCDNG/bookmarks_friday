require "bookmark.rb"

describe Bookmark do
  let(:subject) {Bookmark.new("http://testurl.com", "Testurl")}

  it "returns title of website" do
    expect(subject.title).to eq "Testurl"
  end

  it "returns title of website" do
    expect(subject.url).to eq "http://testurl.com"
  end
end