require 'sinatra'

# Define the application class as a subclass of Sinatra::Base
class App < Sinatra::Base
  # Route to calculate age based on the given birthdate
  get '/calculate_age' do
    # Get the birthdate from the query parameters
    birthdate = params[:birthdate]
    
    # Check if the birthdate is provided
    if birthdate.nil? || birthdate.empty?
      return "Please provide a valid birthdate in the format YYYY-MM-DD."
    end

    # Parse the birthdate to calculate age
    begin
      birthdate_obj = Date.parse(birthdate)
    rescue ArgumentError
      return "Invalid birthdate format. Please use YYYY-MM-DD."
    end

    # Calculate the age
    today = Date.today
    age = today.year - birthdate_obj.year
    age -= 1 if today.yday < birthdate_obj.yday # Adjust age if the birthday hasn't occurred yet this year

    # Return the calculated age
    "The age for the birthdate #{birthdate} is: #{age} years old."
  end
end
