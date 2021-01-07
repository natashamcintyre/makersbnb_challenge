feature 'User login' do 
    scenario 'for user to access account on makersbnb they must log in' do 
        visit ('/') 
            expect(page).to have_link('Login') 
        click_link 'Login' 
            expect(current_path).to eq ('/login') 
            expect(page).to have_content 'Username'  
        fill_in "user[username]", with: "Ben" 
            expect(page).to have_content 'Password' 
        fill_in "user[password]", with: "clond" 
            expect(page).to have_button('Login') 
        click_button 'Login' 
            expect(current_path).to eq('/spaces')
    end 
end 