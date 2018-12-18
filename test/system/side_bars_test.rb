require "application_system_test_case"

class SideBarsTest < ApplicationSystemTestCase
  setup do
    @side_bar = side_bars(:one)
  end

  test "visiting the index" do
    visit side_bars_url
    assert_selector "h1", text: "Side Bars"
  end

  test "creating a Side bar" do
    visit side_bars_url
    click_on "New Side Bar"

    click_on "Create Side bar"

    assert_text "Side bar was successfully created"
    click_on "Back"
  end

  test "updating a Side bar" do
    visit side_bars_url
    click_on "Edit", match: :first

    click_on "Update Side bar"

    assert_text "Side bar was successfully updated"
    click_on "Back"
  end

  test "destroying a Side bar" do
    visit side_bars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Side bar was successfully destroyed"
  end
end
