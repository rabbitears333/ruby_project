require 'rails_helper'

RSpec.feature "Adding reviews to Articles" do
    
    before do
        @john = User.create(email: "john@hotmail.com", password: "password")
        @fred = User.create(email: "fred@hotmail.com", password: "password")
        @article = Article.create!(title: "Title sample", body: "Body of first", user: @john)
    end
    
    scenario "permits a signed in user to write a review" do
        
        login_as(@fred)
        visit "/"
        click_link @article.title
        fill_in "New comment", with: "An amazing article"
        click_button "Add comment"
        
        expect(page).to have_content("Comment has been created")
        expect(page).to have_content("An amazing article")
        expect(current_path).to eq(article_path(@article.id))
        
    end
end