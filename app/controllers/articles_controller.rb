class ArticlesController < ApplicationController
  def new
   @articles = Article.new
  end
  
  def create
    # render plain: params[ :article].inspect
    @articles = Article.new(article_params)
    if  @articles.save
      flash[:notice] = "Article created Successfully"
      redirect_to article_path(@articles)
    else
      render 'new'
    end
  end
  
  def show
    @articles = Article.find(params[ :id])
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end