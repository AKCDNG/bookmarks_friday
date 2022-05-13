feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark' do
    bookmark = List.add("https://www.youtube.com", 'YouTube')
    visit "/bookmarks"
    expect(page).to have_link("YouTube", href: "https://www.youtube.com")
    first('.bookmark').click_button "Edit"
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url', with: "https://learn.co")
    fill_in('title', with: "LearnCo")
    click_button("Submit")

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link("YouTube", href: "https://www.youtube.com")
    expect(page).to have_link("LearnCo", href: "https://learn.co")
  end
end
