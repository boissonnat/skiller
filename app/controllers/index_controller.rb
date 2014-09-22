#encoding: utf-8
class IndexController < ApplicationController

  def index
    render 'public'
  end

  def thanks
    render 'thanks'
  end


end