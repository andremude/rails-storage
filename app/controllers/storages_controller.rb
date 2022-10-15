class StoragesController < ApplicationController
  before_action :set_storage, only: [:update, :destroy]

  # GET
  def index
    if params[:query].present?
      sql_query = "\
      city ILIKE :query\
      OR country ILIKE :query\
      OR storage_type ILIKE :query\
      OR features ILIKE :query\
      "
      @storages = Storage.where(sql_query, query: "%#{params[:query]}%")
      #@storages = Storage.where("city ILIKE ?", "%#{params[:query]}%")
        @markers = @storages.geocoded.map do |storage|
          {
            lat: storage.latitude,
            lng: storage.longitude,
            info_window: render_to_string(partial: "info_window", locals: { storage: storage })
          }
        end
    else
      @storages = Storage.all

      @markers = @storages.geocoded.map do |storage|
        {
          lat: storage.latitude,
          lng: storage.longitude,
          info_window: render_to_string(partial: "info_window", locals: { storage: storage })
        }
      end
    end
  end

  # GET
  def show
    @storage = Storage.find(params[:id])
  end

  # POST
  def create
    @storage = Storage.new(storage_params)
    @storage.user = current_user

    if @storage.save
      redirect_to storages_path
    else
      render :new
    end
  end

  def edit
    # @storage.user = current_user
    @storage = Storage.find(params[:id])
  end

  # PATCH/PUT
  def update
    # @storage.user = current_user
    @storage = Storage.find(params[:id])
    if @storage.update(storage_params)
      redirect_to user_storages_path(current_user)
    else
      redirect_to user_storages_path(current_user), notice: "There was an error."
    end
  end

  # DELETE
  def destroy
    if current_user == @storage.user
      @storage.reservations.empty?
      @storage.destroy
      redirect_to user_storages_path(current_user)
    else
      redirect_to user_storages_path(current_user), notice: "Storage can't be deleted, it has reservations related to it."
    end
  end

  def user_storages
    if params[:user_id]
      @storages = User.find(params[:user_id]).storages
    else
      @storages = Storage.all
    end
  end

  private

  def set_storage
    @storage = Storage.find(params[:id])
  end

  def storage_params
    params.require(:storage).permit(
      :title,
      :description,
      :address,
      :storage_type,
      :city,
      :country,
      :latitude,
      :longitude,
      :price,
      :meters,
      :user_id,
      features: [],
      photos: []
    )
  end

  # def unavailable_dates
  #   reservations.pluck(:start_date, :end_date).map do |range|
  #     { from: range[0], to: range[1] }
  #   end
  # end

end
