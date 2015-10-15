class BandsController < ApplicationController
  # GET /bands
  # GET /bands.json
  def index
    @bands = Band.select("bands.id, bands.name, bands.city, bands.genre, bands_users.band_id, bands_users.user_id").joins(:bands_users).where("bands_users.user_id = :userId", {userId: params[:userId]})
    render json: @bands
  end

  def check_users_in_band_without_phone_number
    @users_without_number = Array.new
    @band = Band.includes(:users).where("id" => params[:bandId])
    @band[0].users.each do |t|
      if (t.phone_number.nil? || t.phone_number.empty?)
        @users_without_number.push(t.name)
      end
    end
    render json: @users_without_number
  end

  def search
    # Below is Necessary for Elastic Search?
    Band.import

    if params[:name].to_s.empty?
      @valid_bands = []
    else 
      @bands = Band.search(params[:name]).records
      @valid_bands = Band.select("bands.id, bands.name, bands.city, bands.genre, bands.user_id as admin_id, band_requests.id as band_requests_id, band_requests.band_id, band_requests.user_id, band_requests.status").joins("left outer join band_requests ON bands.id = band_requests.band_id AND band_requests.user_id = " + BandRequest.sanitize(params[:userId])).where("bands.id" => @bands.map(&:id))
    end
      
    render json: @valid_bands
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
