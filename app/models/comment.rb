class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review
  
  validates :comment_content, presence: true
end
