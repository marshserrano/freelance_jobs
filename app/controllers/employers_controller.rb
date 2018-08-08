class EmployersController < ApplicationController

  def show
    @employer = User.find(params[:id])
  end

end
