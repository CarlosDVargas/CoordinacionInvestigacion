require "application_system_test_case"

class AgreementsTest < ApplicationSystemTestCase
  setup do
    @agreement = agreements(:one)
  end

  test "visiting the index" do
    visit agreements_url
    assert_selector "h1", text: "Agreements"
  end

  test "should create agreement" do
    visit agreements_url
    click_on "New agreement"

    fill_in "Agreementnumber", with: @agreement.agreementNumber
    fill_in "Articlenumber", with: @agreement.articleNumber
    click_on "Create Agreement"

    assert_text "Agreement was successfully created"
    click_on "Back"
  end

  test "should update Agreement" do
    visit agreement_url(@agreement)
    click_on "Edit this agreement", match: :first

    fill_in "Agreementnumber", with: @agreement.agreementNumber
    fill_in "Articlenumber", with: @agreement.articleNumber
    click_on "Update Agreement"

    assert_text "Agreement was successfully updated"
    click_on "Back"
  end

  test "should destroy Agreement" do
    visit agreement_url(@agreement)
    click_on "Destroy this agreement", match: :first

    assert_text "Agreement was successfully destroyed"
  end
end
