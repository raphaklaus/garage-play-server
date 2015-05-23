class NotificationsController < ApplicationController
	#This hour definition in a near future must be redirect to a kind of lib. Dunno...
	def hourFactor
		return 24.0
	end

	def send_email
    #@compromises = Compromise.where("email_notification is true and datehour >= :dateNow and datehour < :next6hours", {:dateNow => DateTime.now, :next6hours => (DateTime.now + (24/hourFactor))})
    @notifications = query_factory(0)

    @notifications.each do |c|
       CompromiseNotifier.send_email_compromise(c).deliver	
       c.sent = true
       c.save
    end

    render json: @notifications
	end

	def send_sms
	    @notifications = query_factory(1)

	    @notifications.each do |c|
	       #CompromiseNotifier.send_email_compromise(c).deliver
				@users_emails = User.all.pluck(:email)
				puts @users_emails.join(',')
	      c.sent = true
	      c.save
	    end

	    render json: @notifications
	end

	private
	def query_factory(type)
		puts 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
		teste = Time.zone.now
		return Notification.select("compromises.title, compromises.description, 
    	compromises.location, compromises.datehour, notifications.*").joins(:compromise)
    	.where("send_date >= :dateNow and send_date < :next6hours and sent is false and notification_type = :type",
    	 {:dateNow => Time.zone.now, :next6hours => 1.day.from_now, :type => type})
	end
end
