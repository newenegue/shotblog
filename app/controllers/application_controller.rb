class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :time_elapsed

  def current_user
  	if session[:user_id]
  		User.find_by(id: session[:user_id])
    end
  end

  def time_elapsed time
  	time_diff = TimeDifference.between(time, Time.now).in_each_component
  	seconds = time_diff[:seconds].to_i
  	minutes = time_diff[:minutes].to_i
  	hours = time_diff[:hours].to_i
  	days = time_diff[:days].to_i
  	weeks = time_diff[:weeks].to_i
  	months = time_diff[:months].to_i
  	years = time_diff[:years].to_i
  	if years >= 1
  		years.to_s + (years == 1 ? ' year ago' : ' years ago')
  	elsif months >= 1
  		months.to_s + (months == 1 ? ' month ago' : ' months ago')
  	elsif weeks >= 1
  		weeks.to_s + (weeks == 1 ? ' week ago' : ' weeks ago')
  	elsif days >= 1
  		days.to_s + (days == 1 ? ' day ago' : ' days ago')
  	elsif hours >= 1
  		hours.to_s + (hours == 1 ? ' hour ago' : ' hours ago')
  	elsif minutes >= 1
  		minutes.to_s + (minutes == 1 ? ' minute ago' : ' minutes ago')
  	else
  		seconds.to_s + (seconds == 1 ? ' second ago' : ' seconds ago')
  	end
  end
end
