class PagesController < ApplicationController
  def home
    if params[:query].present?
      @storages = Storage.where("city ILIKE ?", "%#{params[:query]}%")
    else
      @storages = Storage.all
    end
  end

  def how_it_works
  end

  def user_page
  end
end
