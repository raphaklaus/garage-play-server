class NotificationsController < ApplicationController
	#This hour definition in a near future must be redirect to a kind of lib. Dunno...
	def hourFactor
		return 24.0
	end

	def send_email
    #@compromises = Compromise.where("email_notification is true and datehour >= :dateNow and datehour < :next6hours", {:dateNow => DateTime.now, :next6hours => (DateTime.now + (24/hourFactor))})
    @notifications = query_factory(0)

    @notifications.each do |c|
       CompromiseNotifier.send_compromise(c).deliver	
       c.sent = true
       c.save
    end

    render json: @notifications
	end

	def send_sms
		#todo: Read notification by SMS type, join with due compromises...
		#and make a wget using cron job for the pontocerto SMS service.
	end

	private
	def query_factory(type)
		return Notification.select("compromises.title, compromises.description, 
    	compromises.location, compromises.datehour, notifications.*").joins(:compromise)
    	.where("send_date >= :dateNow and send_date < :next6hours and sent is false and notification_type = :type",
    	 {:dateNow => DateTime.now, :next6hours => (DateTime.now + (24/hourFactor)), :type => type})
	end
end
