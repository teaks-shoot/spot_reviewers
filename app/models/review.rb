class Review < ApplicationRecord
  belongs_to :user
  has_many :review_comments, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true
  

  def self.search_for(content, method)
    if method == 'perfect'
      Review.where(title: content)
    elsif method == 'forward'
      Review.where('title LIKE ?', content + '%')
    elsif method == 'backward'
      Review.where('title LIKE ?', '%' + content)
    else
      Review.where('title LIKE ?', '%' + content + '%')
    end
  end  
  
end
