require 'rails_helper'

RSpec.describe "course_attachments/edit", type: :view do
  before(:each) do
    @course_attachment = assign(:course_attachment, CourseAttachment.create!(
      :course_id => 1,
      :image => "MyString"
    ))
  end

  it "renders the edit course_attachment form" do
    render

    assert_select "form[action=?][method=?]", course_attachment_path(@course_attachment), "post" do

      assert_select "input#course_attachment_course_id[name=?]", "course_attachment[course_id]"

      assert_select "input#course_attachment_image[name=?]", "course_attachment[image]"
    end
  end
end
