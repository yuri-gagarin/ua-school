require 'rails_helper'

RSpec.describe "school_infos/new", type: :view do
  before(:each) do
    assign(:school_info, SchoolInfo.new())
  end

  it "renders new school_info form" do
    render

    assert_select "form[action=?][method=?]", school_infos_path, "post" do
    end
  end
end
