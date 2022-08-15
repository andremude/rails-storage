class StoragesController < ApplicationController
  before_action :set_storage, only: [:show, :update, :destroy]

  # GET
  def index
    @storages = Storage.all
    render json: @storages
  end

  # GET
  def show
    render json: @storage
  end

  # POST
  def create
    @storage = Storage.new(storage_params)
    @storage.user = current_user

    if @storage.save
      render json: @storage, status: :created, location: storage_path(@storage)
    else
      render json: @storage.errors, status: :unprocessable_entity
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
      :price
    )
  end
end
