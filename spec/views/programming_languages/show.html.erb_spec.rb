require 'rails_helper'

RSpec.describe "programming_languages/show", type: :view do
  before(:each) do
    @programming_language = assign(:programming_language, ProgrammingLanguage.create!(
      :name => "Name",
      :categories => "MyText",
      :designed_by => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
