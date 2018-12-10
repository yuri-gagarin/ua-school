require 'rails_helper'

RSpec.describe "index_posts/new", type: :view do
  before(:each) do
    assign(:index_post, IndexPost.new())
  end

  it "renders new index_post form" do
    render

    assert_select "form[action=?][method=?]", index_posts_path, "post" do
    end
  end
end
