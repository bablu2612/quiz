class Level < ApplicationRecord
  belongs_to :module_name
  has_many :quizzes, dependent: :destroy
end
