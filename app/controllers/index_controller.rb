#encoding: utf-8
class IndexController < ApplicationController

  def index
    if current_user
      unless current_user.organization
        flash[:notice] = 'You definitely should set your organization !'
      end
      render 'private'
    else
      render 'public'
    end
  end

  def thanks
    render 'thanks'
  end


end