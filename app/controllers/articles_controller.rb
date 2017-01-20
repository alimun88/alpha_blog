class ArticlesController < ApplicationController
  
  before_action :set_article , only: [:edit, :update, :show, :destroy]
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def new
   @articles = Article.new
  end
  
  def edit
    
  end
  
  def create
    # render plain: params[ :article].inspect
    @articles = Article.new(article_params)
    @articles.user = User.last
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
      render 'edit'
    end
  end
  
  def show
    
  end
  
  def destroy
    @articles.destroy
    
    flash[:danger] = "The Artical was successfully deleted"
    redirect_to articles_path
  end
  
  private
  
    def set_article
      @articles = Article.find(params[ :id])
    end
      
    def article_params
      params.require(:article).permit(:title, :description)
    end
end