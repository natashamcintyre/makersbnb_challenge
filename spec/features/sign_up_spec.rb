feature 'add user' do 
    scenario 'user can create an account' do 
        visit '/' 
        expect(page).to have_link 'create account' 
        click_link 'create account'  
        expect(current_path).to eq '/signup' 
    end  

    scenario 'user should be able to enter details' do  
        visit '/signup' 
        expect(page).to have_content 'Username'  
        expect(page).to have_content 'Email' 
        expect(page).to have_content 'Name'  
        expect(page).to have_content 'Password'   
        expect(page).to have_link 'Submit' 
    end 
end 