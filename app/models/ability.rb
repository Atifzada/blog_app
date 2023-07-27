class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, public: true
    can :read, Comment, public: true

    # user can read their own posts
    return unless user.present?

    can :read, Post, user_id: user.id
    can :destroy, Post, author_id: user.id

    can :read, Comment, user_id: user.id
    can :destroy, Comment, author_id: user.id

    return unless user.role == 'admin' # permission for admins

    can :destroy, Post
    can :destroy, Comment
  end
end
