require 'rails_helper'

RSpec.describe "grades/edit", type: :view do
  before(:each) do
    @grade = assign(:grade, Grade.create!(
      :level => 1,
      :description => "MyString"
    ))
  end

  it "renders the edit grade form" do
    render

    assert_select "form[action=?][method=?]", grade_path(@grade), "post" do

      assert_select "input#grade_level[name=?]", "grade[level]"

      assert_select "input#grade_description[name=?]", "grade[description]"
    end
  end
end
