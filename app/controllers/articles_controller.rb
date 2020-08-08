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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

end