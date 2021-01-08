feature 'Owner logout' do 
    scenario 'So a Owner can protect his/her privacy, they can log out' do  
        visit '/'
    expect(page).to have_link 'Become an Owner!'
    click_link 'Become an Owner!'
    expect(current_path).to eq '/owner/signup'
    expect(page).to have_field 'owner[name]'
    expect(page).to have_field 'owner[username]'
    expect(page).to have_field 'owner[email]'
    expect(page).to have_field 'owner[password]'

    owner = Owner.new(
      name: "Owner",
      username: 'ownerusername',
      email: 'owner@email.com',
      password: 'owner123'
    )

    fill_in 'owner[name]', with: owner.name
    fill_in 'owner[username]', with: owner.username
    fill_in 'owner[email]', with: owner.email
    fill_in 'owner[password]', with: owner.password

    click_button 'Sign up' 

    expect(current_path).to eq("/owner/#{owner.id}")

        visit '/spaces' 

        click_link 'Logout'  

        expect(current_path).to eq '/' 

    end 
end 