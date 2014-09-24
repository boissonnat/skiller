class OrganizationsController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def new
  end

  def create
    if @organization.valid?
      # Add the current user in the organization
      @organization.users << current_user
      if @organization.save
        flash[:notice] = 'Organization successfully saved'
        redirect_to @organization
      else
        render 'new'
      end
    end
  end

  def edit
  end

  def update
  end

  private
  ## Helper methods
  def organization_params
    params.require(:organization).permit(:name, :bio, :image_url)
  end
end
