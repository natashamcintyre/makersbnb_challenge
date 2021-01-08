feature 'list a new space' do
  scenario 'user can sign up as owner' do
    visit '/'
    expect(page).to have_link 'Become an Owner!'
    click_link 'Become an Owner!'
    expect(current_path).to eq '/owner/signup'
    expect(page).to have_field 'owner[name]'
    expect(page).to have_field 'owner[username]'
    expect(page).to have_field 'owner[email]'
    expect(page).to have_field 'owner[password]'

    person = Owner.new(
      name: "Owner",
      username: 'ownerusername',
      email: 'owner@email.com',
      password: 'owner123'
    )

    fill_in 'owner[name]', with: person.name
    fill_in 'owner[username]', with: person.username
    fill_in 'owner[email]', with: person.email
    fill_in 'owner[password]', with: person.password

    click_button 'Sign up'

    new_owner = Owner.all.first

    expect(new_owner.name).to eq person.name
    expect(new_owner.username).to eq person.username
    expect(new_owner.email).to eq person.email
    expect(new_owner.password).to eq person.password
  end

  scenario 'owner can log in as an owner' do
    owner = Owner.create(
      name: "Owner",
      username: 'ownerusername',
      email: 'owner@email.com',
      password: 'owner123'
    )

    visit '/'
    expect(page).to have_link 'Log In as Owner'

    click_link 'Log In as Owner'

    expect(current_path).to eq '/owner/login'

    expect(page).to have_field 'username'
    expect(page).to have_field 'password'

    fill_in 'username', with: owner.username
    fill_in 'password', with: owner.password

    click_button 'Log In'

    expect(current_path).to eq "/owner/#{owner.id}"
  end

  scenario 'user can set up a new space for others to rent' do
    visit '/'
    # NEEDS CHANGING WHEN USER SIGN IN IS IMPLEMENTED
    expect(page).to have_link 'List New Space'

    click_link 'List New Space'

    expect(current_path).to eq '/spaces/new'
    expect(page).to_not have_content 'Sinatra'
  end

  scenario 'listed space is associated with user who listed it' do
    owner = Owner.create(name: "Will", username: "will123", password: "p123", email: "will@me.com")
    visit '/spaces/new'
    expect(page).to have_field("space[owner_id]")
    fill_in "space[name]", with: "Cottage"
    fill_in "space[owner_id]", with: owner.id
    click_on 'Submit'

    expect(current_path).to eq '/spaces'
    cottage = Space.all.first
    expect(cottage.owner).to eq owner
  end




  # scenario 'user can add description and price to their space' do
  #   visit '/spaces/new'

  #   expect(page).to have_field 'space[description]'
  #   expect(page).to have_field 'space[price]'

  #   fill_in 'space[name]', with: 'Cottage'
  #   fill_in 'space[description]', with: 'Quaint and quiet'
  #   fill_in 'space[price]', with: '100'
  #   click_button 'Submit'

  #   expect(page).to have_content 'Cottage'
  #   expect(page).to have_content 'Quaint and quiet'
  #   expect(pgae).to have_content '£100 per night'

  # end
end
