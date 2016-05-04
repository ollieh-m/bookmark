feature "add bookmarks" do

  scenario "user can add another bookmarks" do
    visit('/')
    click_link('Add Link')
    fill_in('title', :with => 'Sample Title')
    fill_in('url', :with => 'http://www.sample.org')
    click_button('Save')
    expect(page).to have_content "Sample Title"
  end

end
