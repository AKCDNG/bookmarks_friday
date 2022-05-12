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
        bookmarks << Bookmark.new(row['id'], row['url'], row['title'])
      end
      bookmarks
  end

  def self.add(url, title)
    if ENV['DB_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    con.exec_params('INSERT INTO bookmarks (url, title) VALUES ($1 ,$2);', [url, title])
  end

  def self.delete(id)
    if ENV['DB_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end

    con.exec_params('DELETE FROM bookmarks WHERE id = $1;', [id])

  end

end
