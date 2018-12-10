require 'rails_helper'

RSpec.describe "workshops/edit", type: :view do
  before(:each) do
    @workshop = assign(:workshop, Workshop.create!())
  end

  it "renders the edit workshop form" do
    render

    assert_select "form[action=?][method=?]", workshop_path(@workshop), "post" do
    end
  end
end
