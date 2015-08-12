class BandsController < ApplicationController
  # GET /bands
  # GET /bands.json
  def index
    @bands = Band.order(created_at: :desc)

    render json: @bands
  end

  # GET /bands/1
  # GET /bands/1.json
  def show
    @band = Band.find(params[:id])

    render json: @band
  end

  # POST /bands
  # POST /bands.json
  def create
    @band = Band.new(band_params)

    if @band.save
      render json: @band, status: :created, location: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bands/1
  # PATCH/PUT /bands/1.json
  def update
    @band = Band.find(params[:id])

    if @band.update(band_params)
      head :no_content
    else
      render json: @band.errors, status: :unprocessable_entity
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
    def band_params
      params.permit(:name, :user_id)
    end  
end
