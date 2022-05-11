require 'list'

describe List do
  before(:each) { empty_test_db }
  before(:each) { insert_2_url }
  describe '#all' do
    
    it 'should return testurls' do
      expect(List.all[0]).to be_instance_of(Bookmark).and have_attributes(:title => 'Testurl1')
      expect(List.all[1]).to be_instance_of(Bookmark).and have_attributes(:title => 'Testurl2')
    end

  end
  
  describe '#add' do
    before(:example) { List.add('http://testurl3.org','Testurl3') }
    
    it 'should return new added bookmark' do
      expect(List.all[2]).to be_instance_of(Bookmark).and have_attributes(:title => 'Testurl3')
    end

  end
end
