  # def my_tours
  #   @agency = Agency.find(params[:id])
  #   @tours = Tour.where(agency_id: @agency.id)
  # end
class UsersController < ApplicationController
  def storages
    if params[:user_id]
      @storages = User.find(params[:user_id]).storages
    else
      @storages = Storage.all
    end
  end
end
