class Request
    include HTTParty
    attr_accessor :path
    def initialize(path = "https://jobs.github.com/positions.json?")
        @path = path
    end

    # def fetch
    #     response = HTTParty.get(full_path)
    #     response.parsed_response
    # end

    def location (location)
    self.class.new(@path += "location=#{location}&")
    end

    def full_time
   self.class.new(@path += "full_time=true&")
    end
     
   def language(language)
    self.class.new(@path += "description=#{language}&") 
    end

    def reset_parameters
        @path = "https://jobs.github.com/positions.json?"
    end

    def full_path
        @path.sub(/&\z/, "")
    end
end
