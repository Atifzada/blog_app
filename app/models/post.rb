class Post < ApplicationRecord
    has_many :posts, foreign_key: 'post_id'
    has_many :commentss, foreign_key: 'post_id'
    belongs_to :author, class_name: 'User'
end
