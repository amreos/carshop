class Ability
  include CanCan::Ability

      def initialize(user)

         user ||= User.new #guest user (not logged in)
      if user.has_role? :admin
        can :manage, :all
      elsif user.has_role? :customer
        can :create, Comment # customer can write comments
        can :delete, Comment # customer can delete his comments
        can :update, Comment do |comment| # customer can write comments
           comment.try(:user) ==user || user.role?(:admin)# customer can only update their comments
        can :read, :all #customer can read all
      else
        can :read, :all
      end


          # Always performed
          can :access, :ckeditor   # needed to access Ckeditor filebrowser

        # Performed checks for actions:
        can [:read, :create, :destroy], Ckeditor::Picture
        can [:read, :create, :destroy], Ckeditor::AttachmentFile
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
