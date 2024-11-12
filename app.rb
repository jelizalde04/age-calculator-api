require 'sinatra'
require 'date'

class App < Sinatra::Base
  set :bind, '0.0.0.0'  # Ensures Sinatra binds to all interfaces

  get '/calculate_age' do
    birthdate = params[:birthdate]

    if birthdate.nil? || birthdate.empty?
      return "Please provide a valid birthdate in the format YYYY-MM-DD."
    end

    begin
      birthdate_obj = Date.parse(birthdate)
    rescue ArgumentError
      return "Invalid birthdate format. Please use YYYY-MM-DD."
    end

    today = Date.today
    age = today.year - birthdate_obj.year
    age -= 1 if today.yday < birthdate_obj.yday

    "The age for the birthdate #{birthdate} is: #{age} years old."
  end
end
