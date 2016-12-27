require "rails_helper"

RSpec.feature "Showing Articles" do
    before do
        @john = User.create(email: "hogn@hotmail.com", password: "password")
        @fred = User.create(email: "fred@example.com", password: "password")
        @article = Article.create(title: "The first article", body: "sample text", user: john)
    end
    
    scenario "To non-signed in user hide the Edit and Delete buttons" do
        visit "/"
        click_link @article.title
        
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(current_path).to eq(article_path(@article))
        
        expect(page).not_to have_link("Edit Article")
        expect(page).not_to have_link("Delete Article")
    end
    
    scenario "To non-owner hide the Edit and Delete buttons" do
        login_as(@fred)
        visit "/"
        click_link @article.title
        
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(current_path).to eq(article_path(@article))
        
        expect(page).not_to have_link("Edit Article")
        expect(page).not_to have_link("Delete Article")
    end
    scenario "To signed-in owner sees the Edit and Delete buttons" do
        login_as(@john)
        visit "/"
        click_link @article.title
        
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(current_path).to eq(article_path(@article))
        
        expect(page).to have_link("Edit Article")
        expect(page).to have_link("Delete Article")
    end
end