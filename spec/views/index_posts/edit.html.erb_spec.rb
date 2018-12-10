require 'rails_helper'

RSpec.describe "index_posts/edit", type: :view do
  before(:each) do
    @index_post = assign(:index_post, IndexPost.create!())
  end

  it "renders the edit index_post form" do
    render

    assert_select "form[action=?][method=?]", index_post_path(@index_post), "post" do
    end
  end
end
