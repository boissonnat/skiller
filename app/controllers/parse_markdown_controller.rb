class ParseMarkdownController < ApplicationController

  include ApplicationHelper

  def index
    if params[:markdown]
      render :text => markdown(params[:markdown])
    end
  end

end
