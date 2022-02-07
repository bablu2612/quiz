class Quiz < ApplicationRecord
    has_many :type_of_quizzes, dependent: :destroy

    after_create :create_type_of_quiz

    def create_type_of_quiz()
        quiz_id=id
        data=Type.all.map{|type| [type.id,quiz_id]}
        columns=[:type_id, :quiz_id]
        TypeOfQuiz.import columns,data
    end
end
