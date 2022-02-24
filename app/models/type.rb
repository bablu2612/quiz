class Type < ApplicationRecord
    has_many :type_of_quiz
    validates :name, uniqueness: true
end
