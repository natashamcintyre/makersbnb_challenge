feature 'list a new space' do
  scenario 'user can set up a new space for others to rent' do
    visit '/spaces'
    # NEEDS CHANGING WHEN USER SIGN IN IS IMPLEMENTED
    expect(page).to have_link 'List New Space'

    click_link 'List New Space'

    expect(current_path).to eq '/spaces/new'
    expect(page).to_not have_content 'Sinatra'
  end

  scenario 'user can add description and price to their space' do
    visit '/spaces/new'

    expect(page).to have_field 'space[description]'
    expect(page).to have_field 'space[price]'

    fill_in 'space[name]', with: 'Cottage'
    fill_in 'space[description]', with: 'Quaint and quiet'
    fill_in 'space[price]', with: '100'
    click_button 'Submit'

    expect(page).to have_content 'Cottage'
    expect(page).to have_content 'Quaint and quiet'
    expect(page).to have_content '100'

  end
end
