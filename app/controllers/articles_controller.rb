class ArticlesController < ApplicationController
  
  def index
    
  end

  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_show(@article)
  end

  def show
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
end