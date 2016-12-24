require "rails_helper"

RSpec.feature "Signin users" do
    before do
        @john = User.create(email: "hogn@hotmail.com", password: "password")
    end
    
    scenario " With valid credentials" do
        visit "/"
        click_link "Sign in"
        fill_in "Email", with: @john.email
        fill_in "Password", with: @john.password
        click_button "Sign In"
        
        expect(page).to have_content("Signed into page successfully")
        expect(page).to have_content("Signed in as #{@john.email}")
        expect(page).not_to have_link("Sign in")
        expect(page).not_to have_link("Sign up")
    end
    
    
end