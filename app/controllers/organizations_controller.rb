class OrganizationsController < ApplicationController

  include ApplicationHelper

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
    if @organization.update_attributes(organization_params)
      flash[:notice] = 'Organization successfully updated.'
      redirect_to @organization
    else
      render 'edit'
    end
  end

  def parse_markdown
    if params[:markdown]
      render :text => markdown(params[:markdown])
    end
  end

  private
  ## Helper methods
  def organization_params
    params.require(:organization).permit(:name, :bio, :image_url, :copy_public_question)
  end
end
