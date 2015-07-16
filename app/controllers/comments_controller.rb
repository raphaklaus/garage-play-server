class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    render json: @comments
  end

  # GET /comments/1
  # GET /comments/1.json
  def getAllCommentsForReminder
    @comments = Comment.select("comments.id, comments.text, comments.created_at, comments.user_id, comments.reminder_id, users.facebook_id, users.name as user_name").joins(:user).where("reminder_id = :reminder_id", { reminder_id: params[:reminder_id]}).order(id: :desc)

    render json: @comments
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    if @comment.update(params[:comment])
      head :no_content
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    request_user = params[:user_id].to_i
    @comment = Comment.find(params[:id])
    if request_user == @comment.user_id
      @comment.destroy
      head :no_content
    else
      render :json => {:message => "The comment\'s user must be the author."}
    end     
  end

  private
    def comment_params
      params.permit(:text, :user_id, :reminder_id)
    end  
end
