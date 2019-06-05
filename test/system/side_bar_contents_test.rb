require "application_system_test_case"

class SideBarContentsTest < ApplicationSystemTestCase
  setup do
    @side_bar_content = side_bar_contents(:one)
  end

  test "visiting the index" do
    visit side_bar_contents_url
    assert_selector "h1", text: "Side Bar Contents"
  end

  test "creating a Side bar content" do
    visit side_bar_contents_url
    click_on "New Side Bar Content"

    click_on "Create Side bar content"

    assert_text "Side bar content was successfully created"
    click_on "Back"
  end

  test "updating a Side bar content" do
    visit side_bar_contents_url
    click_on "Edit", match: :first

    click_on "Update Side bar content"

    assert_text "Side bar content was successfully updated"
    click_on "Back"
  end

  test "destroying a Side bar content" do
    visit side_bar_contents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Side bar content was successfully destroyed"
  end
end
