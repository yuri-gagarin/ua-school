require 'rails_helper'

RSpec.describe "grades/new", type: :view do
  before(:each) do
    assign(:grade, Grade.new(
      :level => 1,
      :description => "MyString"
    ))
  end

  it "renders new grade form" do
    render

    assert_select "form[action=?][method=?]", grades_path, "post" do

      assert_select "input#grade_level[name=?]", "grade[level]"

      assert_select "input#grade_description[name=?]", "grade[description]"
    end
  end
end
