feature 'hire a space' do
    scenario 'user can hire a space for the night' do
        space = Space.create(name: "Cottage")
        visit '/spaces'
        expect(page).to have_content "Cottage"
        expect(page).to have_link "reserve"
        click_link "reserve"
        expect(current_path).to eq "/space/#{space.id}/reserve"
        expect(page).to have_content "Check availability below"
    end

    scenario 'a user can select a date for booking' do
        space = Space.create(name: "Cottage")
        visit '/spaces'
        click_link "reserve"
        expect(page).to have_content "Cottage"
        expect(page).to have_field 'Start date:', type: 'date'

        fill_in 'Start date:', with: Date.today.strftime("%Y-%m-%d")
        
        click_button 'Send Reservation Request'

        expect(page).to have_content "You have requested to reserve #{space.name} on #{Date.today}"
    end
end
