# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
#set :output, "/server_logs/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# every 1.minutes do
# 	command 'wget http://localhost:3000/cron_job/compromise_email'
# end

every :day, :at => ['9am', '12pm', '3pm', '6pm', '9pm'] do
	command 'wget http://localhost:3000/cron_job/compromise_email'
end