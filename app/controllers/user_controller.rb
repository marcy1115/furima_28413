class UserController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    User.create()
  end
  
end
