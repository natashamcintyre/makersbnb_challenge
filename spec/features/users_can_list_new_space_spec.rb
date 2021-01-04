feature 'list a new space' do
  scenario 'user can set up a new space for others to rent' do
    visit '/'
    # NEEDS CHANGING WHEN USER SIGN IN IS IMPLEMENTED
    expect(page).to have_link 'List New Space'

    click_link 'List New Space'

    expect(current_path).to eq '/spaces/new'
    expect(page).to_not have_content 'Sinatra'
  end
end
