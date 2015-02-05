class CompromisesController < ApplicationController
  # GET /compromises
  # GET /compromises.json
  def index
    @compromises = Compromise.order(created_at: :desc).limit(1)

    render json: @compromises
  end

  def load_recent
    @compromises = Compromise.where("id > :first_id", {first_id: params[:id]}).limit(10)
    render json: @compromises
  end

  # Used to load just 10 old entries 
  def load_more
    @compromises = Compromise.where("id < :last_id", {last_id: params[:id]}).order(id: :desc).limit(10)
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
        :facebook_notification, :email_notification)
    end  
end
