class CompromisesController < ApplicationController
  # GET /compromises
  # GET /compromises.json
  def index
    @compromises = Compromise.where("band_id = :bandId", {bandId: params[:bandId]}).order(datehour: :desc).limit(10)

    render json: @compromises
  end

  def load_recent
    @compromises = Compromise.where("id > :first_id AND band_id = :bandId", {first_id: params[:id], bandId: params[:bandId]}).limit(10)
    render json: @compromises
  end

  # Used to load just 10 old entries 
  def load_more
    @compromises = Compromise.where("id < :last_id AND band_id = :bandId", {last_id: params[:id], bandId: params[:bandId]}).order(id: :desc).limit(10)
    render json: @compromises
  end

  # GET /compromises/1
  # GET /compromises/1.json
  def show
    @compromise = Compromise.find(params[:id])

    render json: @compromise
  end

  # POST /compromises
  # POST /compromises.json
  def create
    @compromise = Compromise.new(compromise_params)

    if @compromise.save
      create_for_each_notification_type(@compromise)
      render json: @compromise, status: :created, location: @compromise
    else
      render json: @compromise.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /compromises/1
  # PATCH/PUT /compromises/1.json
  def update
    @compromise = Compromise.find(params[:id])

    if @compromise.update(compromise_params)
      Notification.delete_all(["compromise_id = ?", @compromise.id])
      create_for_each_notification_type(@compromise)
      head :no_content
    else
      render json: @compromise.errors, status: :unprocessable_entity
    end
  end

  # DELETE /compromises/1
  # DELETE /compromises/1.json
  def destroy
    @compromise = Compromise.find(params[:id])
    @compromise.destroy

    head :no_content
  end

  private
    def compromise_params
      params.permit(:title, :description, :datehour, :location, :periodicity, :sms_notification,
        :facebook_notification, :email_notification, :band_id)
    end  

    def create_for_each_notification_type(compromise)
      if compromise.email_notification
      @notification = Notification.new(:compromise_id => compromise.id, 
        :send_date => @compromise.datehour, :notification_type => 0)
      @notification.save
      end
      if compromise.sms_notification
      @notification = Notification.new(:compromise_id => compromise.id, 
        :send_date => @compromise.datehour, :notification_type => 1)
      @notification.save
      end
      if compromise.facebook_notification
      @notification = Notification.new(:compromise_id => compromise.id, 
        :send_date => @compromise.datehour, :notification_type => 2)
      @notification.save
      end
    end
end
