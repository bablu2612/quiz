class ClassName < ApplicationRecord
    has_many :module_names, dependent: :destroy
    has_many :student_quizzes, dependent: :destroy
end
