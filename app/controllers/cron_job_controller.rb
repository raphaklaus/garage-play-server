class CronJobController < ServerTasksController
  def compromise_email
    @compromises = Compromise.where("email_notification is true and datehour >= :dateNow and datehour < :next6hours", {:dateNow => DateTime.now, :next6hours => (DateTime.now + (24/hourFactor))})
    
    @compromises.each do |c|
      CompromiseNotifier.send_compromise(c).deliver	
    end

    render json: @compromises
  end
end