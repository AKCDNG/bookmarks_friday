require "capybara/rspec"
require_relative "../../app"

Capybara.app = BookmarkManager

feature 'bookmarks' do
  before(:each) {
    con = PG.connect :dbname => 'bookmark_manager_test'
    con.exec "INSERT INTO bookmarks(url, title) VALUES ('http://testurl1.pl', 'Testurl1'), ('http://testurl2.es', 'Testurl2');"
   }
  scenario 'view bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content "Testurl1"
    expect(page).to have_content "Testurl2"
  end

  scenario 'add a bookmark' do
    visit '/bookmarks'
    fill_in "add_url", with: "http://testurl3.org"
    fill_in "add_title", with: "Testurl3"
    click_button 'Submit'
    expect(page).to have_content "Testurl3"
  end
end
