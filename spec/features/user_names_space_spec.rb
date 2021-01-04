feature 'name a new space' do 
  scenario 'user can name a space they have listed' do
    visit '/spaces/new'
    expect(page).to have_field("Space Name")

    fill_in "Space Name", with: 'Cottage'
    click_button 'Submit'
    expect(current_path).to eq '/spaces'  
    expect(page).to have_content "Cottage"
  end
end