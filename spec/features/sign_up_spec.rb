feature 'add user' do 
    scenario 'user can create an account' do 
        visit '/' 
        expect(page).to have_link 'Create Account' 
        click_link 'Create Account'  
        expect(current_path).to eq '/signup' 
    end  

    scenario 'user should be able to enter details' do  
        visit '/signup' 
        expect(page).to have_content 'Username'  
        fill_in "user[username]", with: "Ben" 
        expect(page).to have_content 'Email'  
        fill_in "user[email]", with: "Ben@gmail"
        expect(page).to have_content 'Name'   
        fill_in "user[name]", with: "Benedict"
        expect(page).to have_content 'Password'  
        fill_in "user[password]", with: "clond" 
        click_button 'Submit' 
        expect(current_path).to eq '/login'
    end  
end 