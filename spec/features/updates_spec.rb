require 'rails_helper'
describe 'Users can CRUD updates' do
  before :each do
    visit '/'
    click_on 'Create Update'
    fill_in 'update[user]', with: 'Missy'
    fill_in 'update[status]', with: 'Working on CRUD from scratch.'
    fill_in 'update[likes]', with: '2'
    click_on 'Create Update'
  end

  scenario 'User can create an update' do
    expect(page).to have_content('Missy')
  end

  scenario 'User can edit an update' do
    click_on 'Edit'
    fill_in 'update[user]', with: 'Buddy'
    click_on 'Update Update'
    expect(page).to have_content('Buddy')
  end

  scenario 'User can delete an update' do
    click_on 'Delete'
    page.should have_no_content('Working on CRUD from scratch.')
  end
end
