require "rails_helper"

RSpec.feature "Signup users" do
    scenario " With valid credentials" do
        visit "/"
        click_link "Sign up"
        fill_in "Email", with: "lee@lee.com"
        fill_in "Password", with: "password"
        fill_in "password confirmation", with: "password"
        click_button "Sign Up"
        
        expect(page).to have_content("You have signed up")
        
    end
    
    scenario " With invalid credentials" do
        visit "/"
        click_link "Sign up"
        fill_in "Email", with: ""
        fill_in "Password", with: ""
        fill_in "password confirmation", with: ""
        click_button "Sign Up"
        
        expect(page).to have_content("You have not signed up")
        
    end
end