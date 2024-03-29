class AdminAbility
  include CanCan::Ability

  def initialize(user)
    can :access, :rails_admin # needed to access RailsAdmin
    can :dashboard            # dashboard access
    # Performed checks for `collection` scoped actions:
    can :index, :all         # included in :read
    can :new, :all     # included in :create
    can :update, :all
    can :reset, :all
    cannot :export, :all
    cannot :filters ,:all
    cannot :history, :all              # for HistoryIndex
    can :destroy, :all       # for BulkDelete
    can :rating_calculate , :all
  end
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end

