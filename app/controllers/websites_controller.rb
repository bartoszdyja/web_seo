class WebsitesController < ApplicationController
  expose(:website, attributes: :website_params)
  expose(:websites)
  def create
    #self.website =Website.new(website_params)
    if website.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  def index
  end

  private

  def website_params
    params.require(:website).permit(:name)
  end
end
