class CLI
  attr_accessor :parameters
  def initialize
  @parameters = Request.new()
  end
  
def call
   COLORIZER.write" 
     ██╗ ██████╗ ██████╗     ███████╗███████╗ █████╗ ██████╗  ██████╗██╗  ██╗
     ██║██╔═══██╗██╔══██╗    ██╔════╝██╔════╝██╔══██╗██╔══██╗██╔════╝██║  ██║
     ██║██║   ██║██████╔╝    ███████╗█████╗  ███████║██████╔╝██║     ███████║
██   ██║██║   ██║██╔══██╗    ╚════██║██╔══╝  ██╔══██║██╔══██╗██║     ██╔══██║
╚█████╔╝╚██████╔╝██████╔╝    ███████║███████╗██║  ██║██║  ██║╚██████╗██║  ██║
 ╚════╝  ╚═════╝ ╚═════╝     ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝
"                                                                                                                                               
puts ""
    puts "Welcome to the GitHub API Job Search CLI App!"
    user_name = PROMPT.ask("What is your name?", default: ENV["USER"])
  puts "Greetings, #{user_name.capitalize}! I'm gonna ask you some questions about your future dream job."
    location?
end

def location?
  location_prompt = PROMPT.yes?("Would you like to search based on location?") do |q|
      q.suffix "Yes/No"
    end
  if location_prompt
      location = PROMPT.ask("Where would you like to work? You can search by city, state or zip code.\nIf you are looking for remote work, you can also search 'remote'!")
      parameters.location(location)
      full_time?
  else
      full_time?
  end
end

def full_time?
  full_time_prompt = PROMPT.yes?("Would you like to search for full time positions only?") do |q|
      q.suffix "Yes/No"
  end
  if full_time_prompt
      parameters.full_time
      language?
  else
      language?
  end
end

def language?
      language_prompt = PROMPT.yes?("Would you like to search based on coding language?") do |q|
          q.suffix "Yes/No"
      end
      if language_prompt
          language = PROMPT.ask("What coding language would you prefer?")
          parameters.language(language)
          search
      else
          search
      end
end

def search
      puts "Great, let's see if there's a position out there for you!"
      data = API.new.get_data_from_parameters(parameters)
      # binding.pry
      validate_data(data)
end

def validate_data(data)
      if data == []
          puts "Sorry, your search didn't turn up anything."
          search_again?
      else
          print_data(data)
      end
end
  
def print_data(data)
      puts "Here's what we found!"
      data.each do |job|
          job.remove_html_tags
  puts ""
  # COLORIZER.write "_______________________"
  puts "Company: #{job.company}"
  puts "Location: #{job.location}"
  puts "Title: #{job.title}"
  puts "Hours: #{job.type}"
  puts "How to Apply: #{job.application.strip}"
  COLORIZER.write "__________________________________________"
  puts ""
      end
      search_again?
end
  
def search_again?
      search_again = PROMPT.yes?("Would you like to make another search?") do |q|
          q.suffix "Yes/No"
      end
      if search_again
          parameters.reset_parameters
           location?
      else
          puts ""
          puts "Thank you! Good luck on your job hunt!"
          exit
      end
  end
end
