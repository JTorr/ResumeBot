class JobsController < ApplicationController
  before_action :authenticate_user!
  def search
    @results = Cb.job_search_criteria.keywords(params[:qry]).search()
  end

  def details
    @job = Cb.job.find_by_did params[:did]
    @company = Cb.company.find_by_did params[:did]
  end

  def show
  end
end
