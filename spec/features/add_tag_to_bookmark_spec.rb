feature "add tags to bookmarks" do

  xscenario "user can add a tag to a bookmark" do
    visit('/')
    click_link('Add Link')
    fill_in('title', :with => 'Sample Title')
    fill_in('url', :with => 'http://www.sample.org')
    fill_in('tag', :with => 'Sample Tag')
    click_button('Save')
    expect(page).to have_content 'Sample Tag'
  end

end
