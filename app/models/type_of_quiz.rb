class TypeOfQuiz < ApplicationRecord
  belongs_to :quiz
  belongs_to :type
  has_many :questions, dependent: :destroy
  has_rich_text :description
  has_one :main_image
end
