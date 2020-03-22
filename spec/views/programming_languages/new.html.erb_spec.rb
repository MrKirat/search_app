require 'rails_helper'

RSpec.describe "programming_languages/new", type: :view do
  before(:each) do
    assign(:programming_language, ProgrammingLanguage.new(
      :name => "MyString",
      :categories => "MyText",
      :designed_by => "MyText"
    ))
  end

  it "renders new programming_language form" do
    render

    assert_select "form[action=?][method=?]", programming_languages_path, "post" do

      assert_select "input[name=?]", "programming_language[name]"

      assert_select "textarea[name=?]", "programming_language[categories]"

      assert_select "textarea[name=?]", "programming_language[designed_by]"
    end
  end
end
