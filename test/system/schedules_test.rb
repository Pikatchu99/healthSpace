require "application_system_test_case"

class SchedulesTest < ApplicationSystemTestCase
  setup do
    @schedule = schedules(:one)
  end

  test "visiting the index" do
    visit schedules_url
    assert_selector "h1", text: "Schedules"
  end

  test "creating a Schedule" do
    visit schedules_url
    click_on "New Schedule"

    fill_in "Dimanche", with: @schedule.dimanche
    fill_in "Jeudi", with: @schedule.jeudi
    fill_in "Lundi", with: @schedule.lundi
    fill_in "Mardi", with: @schedule.mardi
    fill_in "Mercredi", with: @schedule.mercredi
    fill_in "Samedi", with: @schedule.samedi
    fill_in "Vendredi", with: @schedule.vendredi
    click_on "Create Schedule"

    assert_text "Schedule was successfully created"
    click_on "Back"
  end

  test "updating a Schedule" do
    visit schedules_url
    click_on "Edit", match: :first

    fill_in "Dimanche", with: @schedule.dimanche
    fill_in "Jeudi", with: @schedule.jeudi
    fill_in "Lundi", with: @schedule.lundi
    fill_in "Mardi", with: @schedule.mardi
    fill_in "Mercredi", with: @schedule.mercredi
    fill_in "Samedi", with: @schedule.samedi
    fill_in "Vendredi", with: @schedule.vendredi
    click_on "Update Schedule"

    assert_text "Schedule was successfully updated"
    click_on "Back"
  end

  test "destroying a Schedule" do
    visit schedules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Schedule was successfully destroyed"
  end
end
