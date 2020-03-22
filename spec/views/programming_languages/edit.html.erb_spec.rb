require 'rails_helper'

RSpec.describe "programming_languages/edit", type: :view do
  before(:each) do
    @programming_language = assign(:programming_language, ProgrammingLanguage.create!(
      :name => "MyString",
      :categories => "MyText",
      :designed_by => "MyText"
    ))
  end

  it "renders the edit programming_language form" do
    render

    assert_select "form[action=?][method=?]", programming_language_path(@programming_language), "post" do

      assert_select "input[name=?]", "programming_language[name]"

      assert_select "textarea[name=?]", "programming_language[categories]"

      assert_select "textarea[name=?]", "programming_language[designed_by]"
    end
  end
end
