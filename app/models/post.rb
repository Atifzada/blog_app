class Post < ApplicationRecord
  has_many :posts, foreign_key: 'post_id'
  has_many :commentss, foreign_key: 'post_id'
  belongs_to :author, class_name: 'User'

  after_save :update_posts_counter

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
