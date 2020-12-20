class Categorium < ApplicationRecord
  has_many :study_items, dependent: :destroy
  
  validates :nome, presence: true
end
