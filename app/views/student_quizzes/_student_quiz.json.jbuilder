json.extract! student_quiz, :id, :user_id, :quiz_id, :created_at, :updated_at
json.url student_quiz_url(student_quiz, format: :json)
