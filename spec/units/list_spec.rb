require 'list'

describe List do
  before(:each) {
    con = PG.connect :dbname => 'bookmark_manager_test'
    con.exec "INSERT INTO bookmarks(url, title) VALUES ('http://testurl1.pl', 'Testurl1'), ('http://testurl2.es', 'Testurl2');"
   }
  it 'should return testurls' do
    expect(List.all).to include ('Testurl1')
    expect(List.all).to include ('Testurl2')
  end

  it 'should return new added bookmark' do
    List.add('http://testurl3.org','Testurl3')
    expect(List.all).to include ('Testurl3')
  end
end
