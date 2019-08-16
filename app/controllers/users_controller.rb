class UsersController < ApplicationController
  def show
  	@user= User.find(params[:id])
  	@event= Event.all
  end

  def edit
  	@user= User.new

  end

  def update
  	@user.save
  end
end
