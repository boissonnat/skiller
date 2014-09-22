class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    ##    Rights for ORGANIZATION_ADMIN users         ##
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    if user.role? Role::ORGANIZATION_ADMIN

      ## QUESTIONS
      can :read, Question
      can :create, Question
      can :update, Question
      can :destroy, Question

      ## QUIZZES
      can :read, Quiz
      can :create, Quiz
      can :update, Quiz
      can :destroy, Quiz

    end


  end
end
