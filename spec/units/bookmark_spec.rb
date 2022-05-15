require "bookmark.rb"

describe Bookmark do
  let(:subject) {Bookmark.new(1, "http://testurl.com", "Testurl")}

  it "returns title of website" do
    expect(subject.title).to eq "Testurl"
  end

  it "returns title of website" do
    expect(subject.url).to eq "http://testurl.com"
  end


  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = List.add('Makers Academy', 'http://www.makersacademy.com')

      result = List.find(bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end
end