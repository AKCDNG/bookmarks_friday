require "capybara/rspec"
require_relative "../../app"

Capybara.app = BookmarkManager

feature 'bookmarks' do
  scenario 'view bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content "bookmark1"
  end
end
