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
    @quizzes_pending =  current_user.organization.quizzes.pending
    @quizzes_started =  current_user.organization.quizzes.started
    @quizzes_finished =  current_user.organization.quizzes.finished

    if params[:filter]
      if params[:filter] == Quiz::STATUS_STARTED
        @active = Quiz::STATUS_STARTED
        @quizzes = @quizzes_started
      else
        @active = Quiz::STATUS_FINISHED
        @quizzes = @quizzes_finished
      end
    else
      @active = Quiz::STATUS_PENDING
      @quizzes = @quizzes_pending
    end

  end

  def new
  end

  def create
    if @quiz.valid?
      # Set the organization to the quiz
      @quiz.organization = current_user.organization
      if @quiz.save
        @quiz.slug = nil
        @quiz.save!
        flash[:notice] = 'Quiz successfully created.'
        # Publish activity
        @quiz.create_activity :create, owner: current_user
        redirect_to @quiz
      else
        render 'new'
      end
    end
  end

  def update
    @quiz.status = Quiz::STATUS_FINISHED
    if @quiz.update_attributes(quiz_params)
      flash[:notice] = 'Quiz successfully updated.'
      @quiz.create_activity :update, owner: @quiz.candidate
    else
      flash[:alert] = 'An error occurs'
    end
    redirect_to '/thanks'
  end

  private
  ## Helper methods
  def quiz_params
    params.require(:quiz).permit(:candidate_id, :new_candidate_email, :note, {:application_area_ids => []}, quiz_questions_attributes: [:id, :answer],)
  end

end
