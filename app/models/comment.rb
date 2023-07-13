class Comment < ApplicationRecord
    belongs_to :author, class_name: 'User'
    belongs_to :post
    
  after_save :updte_comment_counter

  private

  def updte_comment_counter
    post.increment!(:comments_counter)
  end
end
