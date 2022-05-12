class Bookmark

  attr_reader :id, :title, :url

  def initialize(id, url, title)
    @id = id
    @title = title
    @url = url
  end

end