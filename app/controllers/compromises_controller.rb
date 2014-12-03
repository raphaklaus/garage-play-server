class CompromisesController < ApplicationController
  # GET /compromises
  # GET /compromises.json
  def index
    @compromises = Compromise.all

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

    if @compromise.update(params[:compromise])
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
      params.permit(:title, :description, :datehour, :location, :periodicity)
    end  
end
