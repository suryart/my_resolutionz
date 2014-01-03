class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def resolutions
    @resolutions = current_user.resolutions
  end

  # if params[:user][:password].blank?
  #   params[:user].delete(:password)
  #   params[:user].delete(:password_confirmation)
  # end
  # https://github.com/plataformatec/devise/wiki/How-To:-Manage-users-through-a-CRUD-interface
end
