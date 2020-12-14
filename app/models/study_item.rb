class StudyItem < ApplicationRecord  
  validates :title, length: {minimum: 4}
  validates :category, presence: true
end
