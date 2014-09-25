#encoding: utf-8
class QuizzesController < ApplicationController

  before_filter :authenticate_user!, except: [:show, :update]
  load_and_authorize_resource :find_by => :slug

  def show
    if current_user
      render 'review'
    else
      @quiz.status = Quiz::STATUS_STARTED
      @quiz.save
      render 'pass'
    end
  end

  def index
    @quizzes = Quiz.all
  end

  def new
  end

  def create
    @quiz.organization = current_user.organization
    if @quiz.save
      @quiz.slug = nil
      @quiz.save!
      flash[:notice] = 'Quiz successfully created.'
      redirect_to @quiz
    else
      render 'new'
    end
  end

  def update
    if @quiz.update_attributes(quiz_params)
      @quiz.status = Quiz::STATUS_FINISHED
      @quiz.save
      flash[:notice] = 'Quiz successfully updated.'
    else
      flash[:alert] = 'An error occurs'
    end
    redirect_to '/thanks'
  end

  private
  ## Helper methods
  def quiz_params
    params.require(:quiz).permit(:candidate_email, :note, {:application_area_ids => []}, quiz_questions_attributes: [:id, :answer],)
  end

end
