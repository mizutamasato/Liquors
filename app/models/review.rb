class Review < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  
  has_many :comments, dependent: :destroy
  has_many :review_tag, dependent: :destroy
  
  validates :name, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :rate, presence: true
  validates :tag, presence: true
  validates :explanation, presence: true

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
