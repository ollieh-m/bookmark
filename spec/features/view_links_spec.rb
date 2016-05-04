require 'spec_helper'

feature 'Viewing links' do
  scenario 'View existing links on the links page' do
    visit '/'
    Link.create(:url => 'http://www.google.com', :title => 'Google')
    expect(page).to have_content('Google')
  end
end