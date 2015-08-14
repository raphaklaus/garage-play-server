class RemindersController < ApplicationController
  # GET /reminders
  # GET /reminders.json
  def index
    @reminders = Reminder.where("band_id = :bandId", {bandId: params[:bandId]}).order(created_at: :desc)

    render json: @reminders
  end

  # GET /reminders/1
  # GET /reminders/1.json
  def show
    @reminder = Reminder.find(params[:id])

    render json: @reminder
  end

  # POST /reminders
  # POST /reminders.json
  def create
    @reminder = Reminder.new(reminder_params)

    if @reminder.save
      render json: @reminder, status: :created, location: @reminder
    else
      render json: @reminder.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reminders/1
  # PATCH/PUT /reminders/1.json
  def update
    @reminder = Reminder.find(params[:id])

    if @reminder.update(params[:reminder])
      head :no_content
    else
      render json: @reminder.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reminders/1
  # DELETE /reminders/1.json
  def destroy
    request_user = params[:user_id].to_i
    @reminder = Reminder.find(params[:id])
    if request_user == @reminder.user_id
      @reminder.destroy
      head :no_content
    else
      render :json => {:message => "The reminder\'s user must be the author."}
    end 
  end

  private
    def reminder_params
      params.permit(:text, :user_id, :band_id, :id)
    end  
end
