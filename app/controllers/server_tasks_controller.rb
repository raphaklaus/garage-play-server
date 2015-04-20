class ServerTasksController < ActionController::API
after_filter :cors

# Disable Cross Domain restrictions due the Facebook Auth.
	def cors
	    headers['Access-Control-Allow-Origin']      = 'localhost'
	    headers['Access-Control-Allow-Methods']     = 'OPTIONS, POST, DELETE, GET, PUT'
	    headers['Access-Control-Allow-Headers']     = 'Origin, X-Requested-With, Content-Type, Accept'
	    headers['Access-Control-Max-Age']           = '1728000'
	end	
end