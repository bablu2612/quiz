json.extract! question, :id, :question, :options, :answer, :type_of_quiz_id, :created_at, :updated_at
json.url question_url(question, format: :json)
