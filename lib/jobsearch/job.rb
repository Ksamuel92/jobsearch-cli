class Job
    
    attr_accessor :company, :location, :title, :type, :application
    @@all = []

    def initialize(args)
        @company = args[:company]
        @location = args[:location]
        @title = args[:title]
        @type = args[:type]
        @application = args.fetch(:application, nil)
        save
    end

    def remove_html_tags
        re = /<("[^"]*"|'[^']*'|[^'">])*>/
        self.application.gsub!(re, '')
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

end