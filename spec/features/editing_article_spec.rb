require 'rails_helper'

RSpec.describe "editing an article" do
    before do
        @article = Article.create(title: "sample article", body: "body one")
    end
    
    scenario "A user updated article" do
        visit "/"
        
        click_link @article.title
        click_link "Edit Article"
        
        fill_in "Title", with: "updated title"
        fill_in "Body", with: "Updated body of article"
        click_button "Update aritlce"
        
        expect(page).to have_content("Article is updated")
        expect(page.current_path).to eq(article_path(@article))
    end
    
    scenario "A user  fails to updated article" do
        visit "/"
        
        click_link @article.title
        click_link "Edit Article"
        
        fill_in "Title", with: ""
        fill_in "Body", with: "Updated body of article"
        click_button "Update aritlce"
        
        expect(page).to have_content("Article was not updated")
        expect(page.current_path).to eq(article_path(@article))
    end
    
end