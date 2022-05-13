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
    result = con.exec_params("INSERT INTO bookmarks (url, title) VALUES ($1 ,$2) RETURNING url, title, id;", [url, title])
    Bookmark.new(result[0]['id'], result[0]['url'], result[0]['title'])
  end


  def self.delete(id)
    if ENV['DB_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end

    con.exec_params('DELETE FROM bookmarks WHERE id = $1;', [id])

  end

  def self.update(id, url, title)
    if ENV['DB_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end

    result = con.exec_params(
      "UPDATE bookmarks SET url = $1, title = $2 WHERE id = $3 RETURNING id, url, title;",
      [url, title, id])

    Bookmark.new(result[0]['id'], result[0]['url'], result[0]['title'])
  end

end
