class CandidatesController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def edit
  end

  def update
    if @candidate.update_attributes(candidate_params)
      flash[:notice] = 'Candidate successfully updated.'
      redirect_to edit_candidate_path(@candidate)
    else
      render 'edit'
    end
  end

  private
  ## Helper methods
  def candidate_params
    params.require(:candidate).permit(:email, :first_name, :last_name, :review)
  end

end
