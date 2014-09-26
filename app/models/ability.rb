class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    ##    Rights for EVERYONE         ##
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##

    ## QUIZZES
    can :read, Quiz
    can :update, Quiz

    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    ##    Rights for DEFAULT_USER     ##
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##

    if user.role? Role::DEFAULT

      ## ORGANIZATION
      can :create, Organization
      can :read, Organization do |o|
        o.users.include? user
      end

    end

    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    ##    Rights for ORGANIZATION_ADMIN users         ##
    ##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~##
    if user.role? Role::ORGANIZATION_ADMIN

      ## ORGANIZATION
      can :update, Organization
      can :parse_markdown, Organization


      ## QUESTIONS
      can :read, Question
      can :list, Question
      can :create, Question
      can :update, Question do |question|
        question.user && question.user.organization == user.organization
      end
      can :destroy, Question
      can :add_to_organization_repository, Question do |question|
        (!user.organization.questions.include? question) && !question.is_private
      end
      can :remove_from_organization_repository, Question do |question|
        (user.organization.questions.include? question) && !question.is_private
      end

      ## QUIZZES
      can :read, Quiz
      can :list, Quiz
      can :create, Quiz
      can :update, Quiz
      can :destroy, Quiz

      ## QUIZ_QUESTIONS
      can :set_as_correct, QuizQuestion do |q|
        !q.is_correct
      end
      can :set_as_incorrect, QuizQuestion do |q|
        q.is_correct
      end

      ## CANDIDATES
      can :update, Candidate do |candidate|
        candidate.organization == user.organization
      end

    end






  end
end
