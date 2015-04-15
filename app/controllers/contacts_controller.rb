class ContactsController < ApplicationController
	def index
		@contacts = Contact.select("contacts.id, contacts.user_id, users.name as user_name, users.email, contacts.text, contacts.created_at, contacts.updated_at").joins(:user)
		render json: @contacts
	end

	def create
		@contact = Contact.new(contact_params)
	    if @contact.save
	      render json: @contact, status: :created, location: @contact
	      ContactNotifier.send_contact_confirmation_email(@contact).deliver
	      ContactNotifier.send_contact_email(@contact).deliver
	    else
	      render json: @contact.errors, status: :unprocessable_entity
	    end
	end

	private
		def contact_params
			params.permit(:user_id, :text, :email, :user_name)
		end
end
