#encoding: utf-8
class QuestionsController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource


  def index
    @questions = Question.all
  end

  def new
  end

  def create
    if @question.save
      flash[:notice] = 'Question successfully saved'
      redirect_to questions_path
    else
      render 'new'
    end
  end

  private
  ## Helper methods
  def question_params
    params.require(:question).permit(:application_area_id, :statement, :answer)
  end

end
