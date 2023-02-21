class Review < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  
  has_many :comments, dependent: :destroy
  
  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
  
end
