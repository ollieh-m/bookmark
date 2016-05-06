feature 'filtering links by tag' do

  scenario 'viewing only links with a specific tag' do
    visit('/links/new')
    fill_in('title', with: 'Example1')
    fill_in('url', with: 'www.example1.com')
    fill_in('tag', with: 'ExampleTag1')
    click_button('Submit')
    visit('/links/new')
    fill_in('title', with: 'Example2')
    fill_in('url', with: 'www.example2.com')
    fill_in('tag', with: 'bubbles')
    click_button('Submit')
    fill_in('tag_filter', with: 'bubbles')
    click_button('Filter')
    expect(page).to have_content('Example2')
    expect(page).not_to have_content('Example1')
  end

end