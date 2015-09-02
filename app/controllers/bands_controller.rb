class BandsController < ApplicationController
  # GET /bands
  # GET /bands.json
  def index
    @bands = Band.select("bands.id, bands.name, bands.city, bands.genre, bands_users.band_id, bands_users.user_id").joins(:bands_users).where("bands_users.user_id = :userId", {userId: params[:userId]})
    #.force_encoding('utf-8')
    # @bands[0].band_id = @bands[0].band_id.force_encoding("ISO-8859-1").encode("UTF-8")
    render json: @bands
  end

  def search
    if params[:name].to_s.empty?
      @bands = []
    else 
      @bands = Band.search params[:name]
    end
      
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
    @user = User.find(band_params[:user_id])
    @band.users << @user

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
      params.permit(:name, :user_id, :city, :genre)
    end  
end
