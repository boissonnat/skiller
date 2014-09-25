#encoding: utf-8
class QuestionsController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    # Create the unused public questions
    @unused_public_questions = []
    Question.is_public.each do |public_question|
      unless current_user.organization.questions.include?(public_question)
        @unused_public_questions << public_question
      end
    end
  end

  def new
  end

  def create
    if @question.valid?
      @question.organizations << current_user.organization
      if @question.save
        flash[:notice] = 'Question successfully saved'
        redirect_to questions_path
      else
        render 'new'
      end
    end
  end

  def edit
  end

  def update
    if @question.update_attributes(question_params)
      flash[:notice] = 'Question successfully updated.'
      redirect_to questions_path
    else
      render 'edit'
    end
  end

  def add_to_organization_repository
    @question.organizations << current_user.organization
    redirect_to questions_path
  end

  def remove_from_organization_repository
    @question.organizations.delete current_user.organization
    redirect_to questions_path
  end

  private
  ## Helper methods
  def question_params
    params.require(:question).permit(:application_area_id, :statement, :right_answer)
  end

end
