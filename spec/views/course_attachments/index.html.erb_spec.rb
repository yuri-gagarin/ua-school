require 'rails_helper'

RSpec.describe "course_attachments/index", type: :view do
  before(:each) do
    assign(:course_attachments, [
      CourseAttachment.create!(
        :course_id => 2,
        :image => "Image"
      ),
      CourseAttachment.create!(
        :course_id => 2,
        :image => "Image"
      )
    ])
  end

  it "renders a list of course_attachments" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
