class CvsController < ApplicationController
  def new
    @cv = current_user.cvs.new
  end

  def create
  end

  def index
  end

  def show
    @cv = Cv.find(params[:id])
  end
end
