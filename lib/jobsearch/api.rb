class API

    def get_data_from_parameters(parameters) # This is with the request Class
        request = RestClient.get(parameters.full_path)
        job_list = JSON.parse(request)
        job_list.map do |job|
            Job.new(:company => job["company"], :location => job["location"], :title => job["title"], :type => job["type"], :application => job["how_to_apply"])
        end
    end

end

        



    # def get_data_location(location)
    #     request = RestClient.get("https://jobs.github.com/positions.json?location=#{location}")
    #     job_list = JSON.parse(request)
    #     job_list.each do |job|
    #         Job.new(:company => job["company"], :location => job["location"], :title => job["title"], :type => job["type"], :application => job["how_to_apply"])
    #     end
    # end

    # def get_data_location_fulltime(location)
    #     request = RestClient.get("https://jobs.github.com/positions.json?full_time=true&location=#{location}")
    #     job_list = JSON.parse(request)
    #     job_list.each do |job|
    #         Job.new(:company => job["company"], :location => job["location"], :title => job["title"], :type => job["type"], :application => job["how_to_apply"])
    #     end
    # end
    # end