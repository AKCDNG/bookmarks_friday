require "capybara/rspec"
require_relative "../../app"

Capybara.app = BookmarkManager

feature 'bookmarks' do
  before(:each) {
    con = PG.connect :dbname => 'bookmark_manager_test'
    con.exec "INSERT INTO bookmarks(url) VALUES ('testurl1'), ('testurl2');"
   }

  scenario 'view bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content "testurl1"
    expect(page).to have_content "testurl2"
  end

  scenario 'add a bookmark' do
    visit '/bookmarks'
    fill_in "add_bookmark", with: "testurl3"
    click_button 'Submit'
    expect(page).to have_content "testurl3"
  end
end
