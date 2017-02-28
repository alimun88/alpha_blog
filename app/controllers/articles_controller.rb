class ArticlesController < ApplicationController
  
  before_action :set_article , only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
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
    @articles.user = current_user
    if  @articles.save
      flash[:success] = "Article created Successfully"
      redirect_to article_path(@articles)
    else
      render 'new'
    end
  end
  
  def update
    
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
      @articles = Article.find(params[:id])
    end
      
    def article_params
      params.require(:article).permit(:title, :description, category_ids: [])
    end
    
    def require_same_user
      if current_user != @articles.user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own article!"
        redirect_to root_path
      end
    end
end