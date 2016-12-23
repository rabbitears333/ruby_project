require "rails_helper"

RSpec.feature "Creating Articles" do
    scenario "A user creates a new article" do
        visit "/"
        click_link "New Article"
        fill_in "Title", with: "Creating a blog"
        fill_in "Body", with: "test body"
        
        click_button "Create Article"
        
        expect(page).to have_content("Article has been created")
        expect(page.current_path).to eq(articles_path)
    end
    
    scenario "A user fails to create a new article" do
        visit "/"
        click_link "New Article"
        fill_in "Title", with: ""
        fill_in "Body", with: ""
        
        click_button "Create Article"
        
        expect(page).to have_content("Article has not been created")
        expect(page).to have_content("Title cannot be empty")
        expect(page).to have_content("Body cannot be empty")
    end
end