class Tag < ApplicationRecord
  
  has_many :review_tag, dependent: :destroy
  
end
