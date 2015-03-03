class RemindersController < ApplicationController
  # GET /reminders
  # GET /reminders.json
  def index
    @reminders = Reminder.order(created_at: :desc)

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
    @reminder = Reminder.find(params[:id])
    @reminder.destroy

    head :no_content
  end

  private
    def reminder_params
      params.permit(:text, :user_id)
    end  
end
