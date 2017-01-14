class ArticlesController < ApplicationController
  def new
   @articles = Article.new
  end
  
  def create
    # render plain: params[ :article].inspect
    @articles = Article.new(article_params)
    @articles.save
    render_to articles_show(@articles)
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end