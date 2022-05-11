require 'pg'
require_relative './bookmark'
class List

  def self.all 
    bookmarks = []
    if ENV['DB_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
      rs = con.exec "SELECT * FROM bookmarks;"
  
      rs.each do |row|
        bookmarks << Bookmark.new(row['url'], row['title'])
      end
      bookmarks
  end

  def self.add(url, title)
    if ENV['DB_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    con.exec "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}');"
  end

end
