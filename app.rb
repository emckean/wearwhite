require 'sinatra'
require 'haml'
require_relative 'birthday_countdown'

get '/' do
	@countdown = BirthdayCountdown.new(3,18)

	 haml @countdown.to_view
end 