class Quiz < ApplicationRecord
    has_many :type_of_quizzes, dependent: :destroy

    after_create :create_type_of_quiz

    def create_type_of_quiz()
        data=[["MCQ",id],["Fill ups",id],["Select one",id],["Jumbled Words",id]]
        columns=[:name, :quiz_id]
        TypeOfQuiz.import columns,data
    end
end
