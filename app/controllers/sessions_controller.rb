class SessionsController < ApplicationController
  before_action :username?
  skip_before_action :username?, only: [:new, :destroy]

  def new
  end

  def create
    session[:name] = params[:name]
    redirect_to '/'
  end

  def destroy
    session.delete :name
    redirect_to sessions_new_path
  end

  private

  def username?
    if params[:name] == nil || params[:name].empty?
      redirect_to sessions_new_path
    end
  end

end
