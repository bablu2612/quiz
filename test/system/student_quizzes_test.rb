require "application_system_test_case"

class StudentQuizzesTest < ApplicationSystemTestCase
  setup do
    @student_quiz = student_quizzes(:one)
  end

  test "visiting the index" do
    visit student_quizzes_url
    assert_selector "h1", text: "Student Quizzes"
  end

  test "creating a Student quiz" do
    visit student_quizzes_url
    click_on "New Student Quiz"

    fill_in "Quiz", with: @student_quiz.quiz_id
    fill_in "User", with: @student_quiz.user_id
    click_on "Create Student quiz"

    assert_text "Student quiz was successfully created"
    click_on "Back"
  end

  test "updating a Student quiz" do
    visit student_quizzes_url
    click_on "Edit", match: :first

    fill_in "Quiz", with: @student_quiz.quiz_id
    fill_in "User", with: @student_quiz.user_id
    click_on "Update Student quiz"

    assert_text "Student quiz was successfully updated"
    click_on "Back"
  end

  test "destroying a Student quiz" do
    visit student_quizzes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student quiz was successfully destroyed"
  end
end
