class KeywordsController < ApplicationController
  expose(:website)
  expose(:keywords)
  expose(:keyword, attributes: :keyword_params)

  def index
  end

  def create
    keyword.website_id=website.id
    if keyword.save
      flash[:notice] = 'Keywords have been successfully added!'
      redirect_to website_keywords_path(website)
    else
      render 'index'
    end

  end

  private

  def keyword_params
    params.require(:keyword).permit(:name)
  end
end
