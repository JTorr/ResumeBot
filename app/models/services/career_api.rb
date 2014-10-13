# class CareerApi
#   include HTTParty
#   base_uri 'http://api.careerbuilder.com'
#
#   def self.job_search
#     @response = self.get "/v1/jobsearch", query: { query: job_keyword }
#   end
#
#   def self.fetch job_posting
#     @response = self.get "/v1/#{job_posting}"
#   end
#
# end
