class ArticlesController < ApplicationController

  #caches_page :index

  def index
   # awesome_log(request.path, :debug)
  	dbconfig = ActiveRecord::Base.remove_connection
  	ActiveRecord::Base.establish_connection(dbconfig)
    @articles = Article.all
    logger.debug '======================='
    logger.debug request.env['GATEWAY_INTERFACE']
    logger.debug '======================='
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      expire_page(:action => :index)
      redirect_to articles_path, :notice => "Article has been created successfully"
    else
      render :action => :new
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
    if @article.update_attributes(params[:article])
       expire_page(:action => :index)
       redirect_to [:articles]
    else
      render :action => :edit
    end
  end
end
