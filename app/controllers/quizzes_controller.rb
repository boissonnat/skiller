#encoding: utf-8
class QuizzesController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @quizzes = Quiz.all
  end

  def new
  end

  def create
    if @quiz.save
      flash[:notice] = 'Quiz successfully created.'
      redirect_to @quiz
    else
      render 'new'
    end
  end

  private
  ## Helper methods
  def quiz_params
    params.require(:quiz).permit(:candidate_email, :note, {:application_area_ids => []})
  end

end
