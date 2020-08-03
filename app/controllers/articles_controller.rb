class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    @all_articles = Article.all
  end

  def new
    @new_article = Article.new
  end

  def create
    @new_article = Article.new(params.require(:article).permit(:title, :description))

    if @new_article.save
      flash[:notice] = "Article was saved successfully."
      redirect_to article_path(@new_article)
      # redirect_to @new_article - this works too
    else
      render 'new'
    end

  end

end