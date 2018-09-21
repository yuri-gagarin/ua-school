require 'rails_helper'

RSpec.describe "course_attachments/show", type: :view do
  before(:each) do
    @course_attachment = assign(:course_attachment, CourseAttachment.create!(
      :course_id => 2,
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Image/)
  end
end
