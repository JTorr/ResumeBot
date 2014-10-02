class CareerApi
  include HTTParty
  base_uri 'http://api.careerbuilder.com'

  def self.job_search
    @response = self.get "/search.json", query: { query: job_keyword }
  end
end
