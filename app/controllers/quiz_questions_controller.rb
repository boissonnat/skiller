#encoding: utf-8
class QuizQuestionsController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def set_as_correct
    unless @quiz_question.is_correct
      @quiz_question.is_correct = true
      @quiz_question.quiz.note += 1
      @quiz_question.quiz.save
      @quiz_question.save
    end
    redirect_to @quiz_question.quiz
  end

  def set_as_incorrect
    if @quiz_question.is_correct
      @quiz_question.is_correct = false
      if @quiz_question.quiz.note > 0
        @quiz_question.quiz.note -= 1
      end
      @quiz_question.quiz.save
      @quiz_question.save

    end

    redirect_to @quiz_question.quiz
  end


end
