require "test_helper"

class StudentQuizzesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_quiz = student_quizzes(:one)
  end

  test "should get index" do
    get student_quizzes_url
    assert_response :success
  end

  test "should get new" do
    get new_student_quiz_url
    assert_response :success
  end

  test "should create student_quiz" do
    assert_difference('StudentQuiz.count') do
      post student_quizzes_url, params: { student_quiz: { quiz_id: @student_quiz.quiz_id, user_id: @student_quiz.user_id } }
    end

    assert_redirected_to student_quiz_url(StudentQuiz.last)
  end

  test "should show student_quiz" do
    get student_quiz_url(@student_quiz)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_quiz_url(@student_quiz)
    assert_response :success
  end

  test "should update student_quiz" do
    patch student_quiz_url(@student_quiz), params: { student_quiz: { quiz_id: @student_quiz.quiz_id, user_id: @student_quiz.user_id } }
    assert_redirected_to student_quiz_url(@student_quiz)
  end

  test "should destroy student_quiz" do
    assert_difference('StudentQuiz.count', -1) do
      delete student_quiz_url(@student_quiz)
    end

    assert_redirected_to student_quizzes_url
  end
end
