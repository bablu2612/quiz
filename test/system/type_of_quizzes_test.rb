require "application_system_test_case"

class TypeOfQuizzesTest < ApplicationSystemTestCase
  setup do
    @type_of_quiz = type_of_quizzes(:one)
  end

  test "visiting the index" do
    visit type_of_quizzes_url
    assert_selector "h1", text: "Type Of Quizzes"
  end

  test "creating a Type of quiz" do
    visit type_of_quizzes_url
    click_on "New Type Of Quiz"

    fill_in "Description", with: @type_of_quiz.description
    fill_in "Name", with: @type_of_quiz.name
    fill_in "Quiz", with: @type_of_quiz.quiz_id
    click_on "Create Type of quiz"

    assert_text "Type of quiz was successfully created"
    click_on "Back"
  end

  test "updating a Type of quiz" do
    visit type_of_quizzes_url
    click_on "Edit", match: :first

    fill_in "Description", with: @type_of_quiz.description
    fill_in "Name", with: @type_of_quiz.name
    fill_in "Quiz", with: @type_of_quiz.quiz_id
    click_on "Update Type of quiz"

    assert_text "Type of quiz was successfully updated"
    click_on "Back"
  end

  test "destroying a Type of quiz" do
    visit type_of_quizzes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Type of quiz was successfully destroyed"
  end
end
