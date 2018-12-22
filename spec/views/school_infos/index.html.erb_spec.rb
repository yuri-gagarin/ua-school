require 'rails_helper'

RSpec.describe "school_infos/index", type: :view do
  before(:each) do
    assign(:school_infos, [
      SchoolInfo.create!(),
      SchoolInfo.create!()
    ])
  end

  it "renders a list of school_infos" do
    render
  end
end
