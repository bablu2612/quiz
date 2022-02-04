class Quiz < ApplicationRecord
    has_many :type_of_quizzes, dependent: :destroy

    after_create :create_type_of_quiz

    def create_type_of_quiz()
        data=[[1,id],[2,id],[3,id],[4,id],[5,id]]
        columns=[:type_id, :quiz_id]
        TypeOfQuiz.import columns,data
    end
end
