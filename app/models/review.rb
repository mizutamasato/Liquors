class Review < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  
  has_many :comments, dependent: :destroy
  has_many :review_tag, dependent: :destroy
  
  #タグの完全一致による検索
  def self.search(search_word)
    Review.where(['tag LIKE ?', "#{search_word}"])
  end
  
  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
end
