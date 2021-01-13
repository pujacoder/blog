class ArticlesController < ApplicationController
  #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  load_and_authorize_resource
  #before_action :set_article,only:[:show,:edit,:update,:destroy]
  def index
    @articles=Article.all
  end

  def import
    @article=Article.import(params[:file])
    #if user_signed_in?
     #   @article.creator=current_user.email
      #else
       # @article.creator="Guest"
      #end
      @article.save 
    redirect_to root_path, notice: "acivity data imported"
  end
  def show
    @article=Article.find(params[:id])
  end

  def new
    @article =Article.new
    
  end

  def create
    @article=Article.new(article_params)
    

    if @article.save
      if user_signed_in?
        @article.user_id=current_user.id
        @article.creator=current_user.email
      else
        @article.creator="Guest"
      end
      @article.save
      redirect_to @article

    else
      render :new
    end
  end
    def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end
  private
  def article_params
    params.require(:article).permit(:title,:body)
  end
  

end
