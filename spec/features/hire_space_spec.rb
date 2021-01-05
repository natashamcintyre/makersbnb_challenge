feature 'hire a space' do 
    scenario 'user can hire a space for the night' do  
        Space.create(name: "Cottage")
        visit '/spaces' 
        expect(page).to have_content "Cottage" 
        expect(page).to have_link "reserve" 
        click_link "reserve" 
        expect(current_path).to eq '/space/:id/reserve' 
        expect(page).to have_content "You have reserved Cottage for one night.:)"
    end 
end 