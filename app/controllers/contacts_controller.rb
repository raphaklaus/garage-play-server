class ContactsController < ApplicationController
	def index
		@contacts = Contact.all
		render json: @contacts
	end

	def create
		@contact = Contact.new(contact_params)

	    if @contact.save
	      render json: @contact, status: :created, location: @contact
	    else
	      render json: @contact.errors, status: :unprocessable_entity
	    end
	end

	private
		def contact_params
			params.permit(:user_id, :text)
		end
end
