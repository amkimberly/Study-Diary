class StudyItem < ApplicationRecord  
  belongs_to :categoria, optional: true
  has_many :comments, dependent: :destroy

  validates :title, length: {minimum: 4}


  def category
    category = Categorium.find(category_id)
  end

  def finished?
    finished_at.present?
  end

  def overdue?
    deadline.present?
      if Date.current > deadline 
      <p>Status: Atrasado</p>
      end
  end

end
