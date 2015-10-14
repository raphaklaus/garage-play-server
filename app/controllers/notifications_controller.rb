require 'open-uri'
require 'json'

class NotificationsController < ApplicationController
	#This hour definition in a near future must be redirect to a kind of lib. Dunno...
	def hourFactor
		return 24.0
	end

	def send_email
    #@compromises = Compromise.where("email_notification is true and datehour >= :dateNow and datehour < :next6hours", {:dateNow => DateTime.now, :next6hours => (DateTime.now + (24/hourFactor))})
	    @notifications = query_factory(0, 2.day.from_now)

	    @notifications.each do |c|
	       CompromiseNotifier.send_email_compromise(c).deliver	
	       c.sent = true
	       c.save
	    end

	    render json: @notifications
	end

	def send_sms
	    @notifications = query_factory(1, 1.day.from_now)

	    @notifications.each do |c|
				@users_phones = User.all.pluck(:phone_number)
				@users_phones.each do |p|
					if !(p.nil? || p.empty?)
						@message = "GaragePlay Compromisso: " + c.title + ", em " + c.datehour.strftime("%d/%m/%Y as %H:%M") + ", local: " + c.location;
						open('http://www.painelsms.com.br/sms.php?i=1101&s=h8jz0d&funcao=enviar&mensagem=' + URI.encode(@message) + '&destinatario=' + p)
					end
				end
	      c.sent = true
	      c.save
	    end

	    render json: @notifications
	end

	private
	def query_factory(type, days_before)
		return Notification.select("compromises.title, compromises.description, 
    	compromises.location, compromises.datehour, compromises.band_id, notifications.*").joins(:compromise)
    	.where("send_date >= :dateNow and send_date < :hoursBefore and sent is false and notification_type = :type",
    	 {:dateNow => Time.zone.now, :hoursBefore => days_before, :type => type})
	end
end
