require 'rails_helper'

RSpec.describe "grades/index", type: :view do
  before(:each) do
    assign(:grades, [
      Grade.create!(
        :level => 2,
        :description => "Description"
      ),
      Grade.create!(
        :level => 2,
        :description => "Description"
      )
    ])
  end

  it "renders a list of grades" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
