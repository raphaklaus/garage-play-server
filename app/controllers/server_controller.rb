class ServerController < ApplicationController
	def check_health
        render json: {status: true}
	end
end
