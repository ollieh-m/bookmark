feature "add tags to bookmarks" do

  scenario "user can add a tag to a bookmark" do
    visit('/')
    click_link('Add Link')
    fill_in('title', :with => 'Tag test')
    fill_in('url', :with => 'http://www.tagtest.org')
    fill_in('tag', :with => 'Sample Tag')
    click_button('Save')
    expect(page).to have_content('Sample Tag')
    # bookmark = Bookmark.first
    # expect(bookmark.tags.map(&:name)).to include('Sample Tag')
  end

end
