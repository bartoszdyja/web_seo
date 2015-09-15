class WebsitesController < ApplicationController
  def create
    @website =Website.new(website_params)
    @website.save
    render 'index'
  end

  def index
    @website = Website.new
    @websites = Website.all
  end

  private

  def website_params
    params.require(:website).permit(:name)
  end
end
