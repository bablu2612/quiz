class StudentQuiz < ApplicationRecord
  belongs_to :user
  belongs_to :class_name
end
