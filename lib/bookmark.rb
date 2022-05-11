class Bookmark

  attr_reader :title, :url

  def initialize(url, title)
    @title = title
    @url = url
  end

end