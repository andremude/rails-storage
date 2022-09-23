class StoragesController < ApplicationController
  before_action :set_storage, only: [:show, :update, :destroy]

  # GET
  def index
    if params[:query].present?
      @storages = Storage.where("city ILIKE ?", "%#{params[:query]}%")
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

  # PATCH/PUT
  def update
    if @storage.update(storage_params)
      render json: @storage
    else
      render json: @storage.errors, status: :unprocessable_entity
    end
  end

  # DELETE
  def destroy
    if current_user == @storage.user
      @storage.destroy
    else
      render json: @storage.errors, status: :unprocessable_entity
    end
  end

  private

  def set_storage
    @storage = Storage.find(params[:id])
  end

  def storage_params
    params.require(:storage).permit(
      :title,
      :meters,
      :address,
      :city,
      :latitude,
      :longitude,
      :price,
      photos: []
    )
  end
end
