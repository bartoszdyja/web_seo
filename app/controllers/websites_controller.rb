class WebsitesController < ApplicationController
  expose(:website, attributes: :website_params)
  expose(:websites)
  def create
    user_id = current_user.id
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
    params.require(:website).permit(:name, :user_id)
  end
end
