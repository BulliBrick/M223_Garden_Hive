class ArticlesController < ApplicationController
  before_action :require_login
  
  def index
    Article.where(status: 'active')

  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @articl.destroy
    redirect_to articles_path
  end
end
