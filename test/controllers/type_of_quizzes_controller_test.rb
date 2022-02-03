require "test_helper"

class TypeOfQuizzesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_of_quiz = type_of_quizzes(:one)
  end

  test "should get index" do
    get type_of_quizzes_url
    assert_response :success
  end

  test "should get new" do
    get new_type_of_quiz_url
    assert_response :success
  end

  test "should create type_of_quiz" do
    assert_difference('TypeOfQuiz.count') do
      post type_of_quizzes_url, params: { type_of_quiz: { description: @type_of_quiz.description, name: @type_of_quiz.name, quiz_id: @type_of_quiz.quiz_id } }
    end

    assert_redirected_to type_of_quiz_url(TypeOfQuiz.last)
  end

  test "should show type_of_quiz" do
    get type_of_quiz_url(@type_of_quiz)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_of_quiz_url(@type_of_quiz)
    assert_response :success
  end

  test "should update type_of_quiz" do
    patch type_of_quiz_url(@type_of_quiz), params: { type_of_quiz: { description: @type_of_quiz.description, name: @type_of_quiz.name, quiz_id: @type_of_quiz.quiz_id } }
    assert_redirected_to type_of_quiz_url(@type_of_quiz)
  end

  test "should destroy type_of_quiz" do
    assert_difference('TypeOfQuiz.count', -1) do
      delete type_of_quiz_url(@type_of_quiz)
    end

    assert_redirected_to type_of_quizzes_url
  end
end
