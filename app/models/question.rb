class Question < ApplicationRecord
  belongs_to :type_of_quiz
  serialize :options, Array
end
