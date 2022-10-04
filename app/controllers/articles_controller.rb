class ArticlesController < ApplicationController
  before_action :set_article , only: [:show , :edit , :update , :destroy]


  

    def show
        
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
      
      @article = Article.new(aricle_params )
      if @article.save
        flash[:notice] = "article was created sucesfully"
        redirect_to @article
      else
        render 'new'
      end
    end

    def edit
     

    end


    def update
      
     
      if @article.update(aricle_params) 
        flash[:notice] = "article was updated sucesfully"
        redirect_to @article
      else
        render 'edit'
      end

    end


    def destroy
     
      @article.destroy
      redirect_to articles_path

    end

    private

    def set_article
      @article = Article.find(params[:id])

    end

    def aricle_params
      params.require(:article).permit(:name , :description)
    end


    
end