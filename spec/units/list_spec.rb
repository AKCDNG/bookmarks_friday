require 'list'

describe List do
  it 'should return a list of bookmarks' do
    list = List.new
    list.instance_variable_set(:@bookmarks, ['bookmark1', 'bookmark2']) 
    expect(list.all).to eq ['bookmark1', 'bookmark2']
  end
end