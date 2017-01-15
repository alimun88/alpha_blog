class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  def new
   @articles = Article.new
  end
  
  def edit
    @articles = Article.find(params[:id])
  end
  
  def create
    # render plain: params[ :article].inspect
    @articles = Article.new(article_params)
    if  @articles.save
      flash[:success] = "Article created Successfully"
      redirect_to article_path(@articles)
    else
      flash[:danger] = @articles.errors.full_messages.join(", ")
      render 'new'
    end
  end
  
  def update
    @articles = Article.find(params[:id])
    if @articles.update(article_params)
      flash[:success] = "Article updated Successfully"
      redirect_to article_path(@articles)
    else
      flash[:danger] = @articles.errors.full_messages.join(", ")
      render 'edit'
    end
  end
  
  def show
    @articles = Article.find(params[ :id])
  end
  
  def destroy
    @articles = Article.find(params[ :id])
    @articles.destroy
    
    flash[:success] = "The Artical was successfully deleted"
    redirect_to articles_path
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end