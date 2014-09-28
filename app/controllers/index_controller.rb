#encoding: utf-8
class IndexController < ApplicationController

  def index
    if current_user
      unless current_user.organization
        redirect_to new_organization_path
      else
        redirect_to activities_path
      end
    else
      render 'public'
    end
  end

  def thanks
    render 'thanks'
  end


end