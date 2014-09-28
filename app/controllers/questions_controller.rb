#encoding: utf-8
class QuestionsController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    # Create the unused public questions
    @unused_public_questions = []
    Question.is_public.order('created_at desc').each do |public_question|
      unless current_user.organization.questions.include?(public_question)
        @unused_public_questions << public_question
      end
    end
  end

  def new
  end

  def create
    if @question.valid?
      @question.user = current_user
      @question.organizations << current_user.organization
      if @question.save
        flash[:notice] = 'Question successfully saved'
        @question.create_activity :create, owner: current_user
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
      @question.create_activity :update, owner: current_user
      redirect_to questions_path
    else
      render 'edit'
    end
  end

  def add_to_organization_repository
    @question.organizations << current_user.organization
    @question.create_activity :add_to_repository, owner: current_user
    redirect_to questions_path
  end

  def remove_from_organization_repository
    @question.organizations.delete current_user.organization
    @question.create_activity :remove_from_repository, owner: current_user
    redirect_to questions_path
  end

  private
  ## Helper methods
  def question_params
    params.require(:question).permit(:title, :application_area_id, :is_private, :statement, :right_answer)
  end

end
