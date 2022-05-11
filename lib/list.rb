require 'pg'
class List

  def self.all 
    if ENV['DB_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
      rs = con.exec "SELECT url FROM bookmarks;"
  
      rs.map do |row|
        row['url']
      end
  end

  def self.add(new_bookmark)
    if ENV['DB_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    con.exec "INSERT INTO bookmarks (url) VALUES ('#{new_bookmark}');"
  end

end
