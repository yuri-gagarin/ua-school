require 'rails_helper'

RSpec.describe "school_infos/edit", type: :view do
  before(:each) do
    @school_info = assign(:school_info, SchoolInfo.create!())
  end

  it "renders the edit school_info form" do
    render

    assert_select "form[action=?][method=?]", school_info_path(@school_info), "post" do
    end
  end
end
