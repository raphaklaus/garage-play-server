class BandRequestsController < ApplicationController
  # GET /bands
  # GET /bands.json
  # def index
  #   @bands = Band.select("bands.id, bands.name, bands.city, bands.genre, bands_users.band_id, bands_users.user_id").joins(:bands_users).where("bands_users.user_id = :userId", {userId: params[:userId]})

  #   render json: @bands
  # end

  # GET /bands/1
  # GET /bands/1.json
  def show
    @band_requests = BandRequest.find(params[:id])

    render json: @band_requests
  end

  # POST /bands
  # POST /bands.json
  def create
    @band_requests = BandRequest.new(band_requests_params)

    if @band_requests.save
      render json: @band_requests, status: :created, location: @band_requests
    else
      render json: @band_requests.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bands/1
  # PATCH/PUT /bands/1.json
  def update
    @band_requests = BandRequest.find(params[:id])

    if @band_requests.update(band_requests_params)
      head :no_content
    else
      render json: @band_requests.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bands/1
  # DELETE /bands/1.json
  # def destroy
  #   @band = Compromise.find(params[:id])
  #   @band.destroy

  #   head :no_content
  # end

  private
    def band_requests_params
      params.permit(:band_id, :user_id, :status)
    end  
end
