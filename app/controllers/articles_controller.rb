class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  def index
    @article = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create 
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article has been created"
      redirect_to articles_path
    else
      flash.now[:danger] = "Article has not been created"
      render :new
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Article has been updated"
      redirect_to @article
    else
      flash.now[:danger] = "Article has not been updated"
      render :edit
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy 
      flash[:success] = "Article has been deleted"
      redirect_to articles_path
    end
  end
  
  protected
  
    def resource_not_found
      message= "The article you are looking for is not found"
      flash[:alert] = message
      redirect_to root_path
    end

  private
  
    def set_article 
      @article = Article.find(params[:id])
    end
  
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
