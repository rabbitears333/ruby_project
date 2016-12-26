require "rails_helper"

RSpec.feature "Creating Articles" do
    before do
        @john = User.create!(email: "hogn@hotmail.com", password: "password")
        login_as(@john)
    end
    scenario "A user creates a new article" do
        visit "/"
        click_link "New Article"
        fill_in "Title", with: "Creating a blog"
        fill_in "Body", with: "test body"
        
        click_button "Create Article"
        
        expect(Article.last.user).to eq(@john)
        expect(page).to have_content("Article has been created")
        expect(page.current_path).to eq(articles_path)
        expect(page).to have_content("Created By: #{@john.email}")

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