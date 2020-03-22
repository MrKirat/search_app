require 'rails_helper'

RSpec.describe "programming_languages/index", type: :view do
  before(:each) do
    assign(:programming_languages, [
      ProgrammingLanguage.create!(
        :name => "Name",
        :categories => "MyText",
        :designed_by => "MyText"
      ),
      ProgrammingLanguage.create!(
        :name => "Name",
        :categories => "MyText",
        :designed_by => "MyText"
      )
    ])
  end

  it "renders a list of programming_languages" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
