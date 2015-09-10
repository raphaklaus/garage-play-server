class BandRequestsController < ApplicationController
  # GET /bands
  # GET /bands.json
  def index
    # DO NOT FORGET TO LIMIT ACCESS OUTSIDE LOCALHOST, OR NOT? 
    
    @bands = BandRequest.select("band_requests.id as band_requests_id, band_requests.band_id, band_requests.user_id, band_requests.status, users.id as user_id, users.name, users.email").joins(:user).where("band_id = :bandId AND status = 0", {bandId: params[:band_id]})

    render json: @bands
  end

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
      if params[:status] == 1
        @band = Band.find(params[:band_id])
        @user = User.find(params[:user_id])
        @band.users << @user
        @band.save
      end
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
