feature 'list a new space' do
  scenario 'user can set up a new space for others to rent' do
    visit '/'
    # NEEDS CHANGING WHEN USER SIGN IN IS IMPLEMENTED
    expect(page).to have_button 'List New Space'

    click_button 'List New Space'

    expect(current_path).to eq '/spaces'
  end
end
