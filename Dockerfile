# Use the official Ruby image as the base image
FROM ruby:3.1

# Set the working directory in the container
WORKDIR /app

# Install dependencies
RUN gem install sinatra rackup webrick

# Copy the app files into the container
COPY . /app

# Expose the port Sinatra will run on
EXPOSE 4567

# Start the application using ruby
CMD ["ruby", "app.rb"]
