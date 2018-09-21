require 'rails_helper'

RSpec.describe "course_attachments/new", type: :view do
  before(:each) do
    assign(:course_attachment, CourseAttachment.new(
      :course_id => 1,
      :image => "MyString"
    ))
  end

  it "renders new course_attachment form" do
    render

    assert_select "form[action=?][method=?]", course_attachments_path, "post" do

      assert_select "input#course_attachment_course_id[name=?]", "course_attachment[course_id]"

      assert_select "input#course_attachment_image[name=?]", "course_attachment[image]"
    end
  end
end
