require 'list'

describe List do
  before(:each) { empty_test_db }
  before(:each) { insert_2_url }
  describe '.all' do
    
    it 'should return testurls' do
      expect(List.all[0]).to be_instance_of(Bookmark).and have_attributes(:title => 'Testurl1')
      expect(List.all[1]).to be_instance_of(Bookmark).and have_attributes(:title => 'Testurl2')
    end

  end
  
  describe '.add' do
    before(:example) { List.add('http://testurl3.org','Testurl3') }
    
    it 'should return new added bookmark' do
      expect(List.all[2]).to be_instance_of(Bookmark).and have_attributes(:title => 'Testurl3')
    end

  end

  describe '.delete' do
    it 'should remove the selected bookmark' do
      List.delete(1)
      expect(List.all[0]).to be_instance_of(Bookmark).and have_attributes(:title => 'Testurl2')
    end
  end

  describe '.update' do
    it 'updates a bookmark' do
      bookmark = List.add("https://www.youtube.com", 'YouTube')
      updated_bookmark = List.update(bookmark.id, "https://learn.co", "LearnCo")

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.url).to eq "https://learn.co"
      expect(updated_bookmark.title).to eq "LearnCo"
    end
  end
end
