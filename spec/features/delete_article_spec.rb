require 'rails_helper'

RSpec.describe "editing an article" do
    before do
        @john = User.create(email: "hogn@hotmail.com", password: "password")
        login_as(john)
        @article = Article.create(title: "sample article", body: "body one", user: john)
    end
    
    scenario   "A user deleted an article" do
        visit "/"
        
        click_link @article.title
        click_link "Delete an article"
        expect(page).to have_content("Article was deleted")
        expect(current_path).to eq(articles_path)
    end
end