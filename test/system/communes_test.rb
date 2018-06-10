require "application_system_test_case"

class CommunesTest < ApplicationSystemTestCase
  setup do
    @commune = communes(:one)
  end

  test "visiting the index" do
    visit communes_url
    assert_selector "h1", text: "Communes"
  end

  test "creating a Commune" do
    visit communes_url
    click_on "New Commune"

    fill_in "Commune", with: @commune.commune
    fill_in "Dep", with: @commune.dep
    fill_in "Depcom", with: @commune.depcom
    fill_in "Geo Centre", with: @commune.geo_centre
    fill_in "Geo Contour", with: @commune.geo_contour
    fill_in "Geo Surface", with: @commune.geo_surface
    click_on "Create Commune"

    assert_text "Commune was successfully created"
    click_on "Back"
  end

  test "updating a Commune" do
    visit communes_url
    click_on "Edit", match: :first

    fill_in "Commune", with: @commune.commune
    fill_in "Dep", with: @commune.dep
    fill_in "Depcom", with: @commune.depcom
    fill_in "Geo Centre", with: @commune.geo_centre
    fill_in "Geo Contour", with: @commune.geo_contour
    fill_in "Geo Surface", with: @commune.geo_surface
    click_on "Update Commune"

    assert_text "Commune was successfully updated"
    click_on "Back"
  end

  test "destroying a Commune" do
    visit communes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Commune was successfully destroyed"
  end
end
