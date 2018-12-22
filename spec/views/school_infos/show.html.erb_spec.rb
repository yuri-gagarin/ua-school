require 'rails_helper'

RSpec.describe "school_infos/show", type: :view do
  before(:each) do
    @school_info = assign(:school_info, SchoolInfo.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
