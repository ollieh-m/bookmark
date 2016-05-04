feature "view bookmarks" do

  scenario "user can see a list of bookmarks" do
    Bookmark.create(name: "Test Link", url:"http://www.google.com")
    visit ('/')
    within('ul#bookmarks') do
      expect(page).to have_content "Test Link"
    end
  end

end
