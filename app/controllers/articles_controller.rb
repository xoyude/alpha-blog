class ArticlesController < ApplicationController

def show
 @article = Article.find(params[:id])
end

def index
@articles = Article.all
end

def new
@article=Article.new
end

def create
    @article = Article.new(article_params)
    if @article.save
        flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render 'new', status: 422
    end
end
  
private

def article_params
  params.require(:article).permit(:id, :title, :description)
end

end