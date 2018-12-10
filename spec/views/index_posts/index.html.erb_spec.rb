require 'rails_helper'

RSpec.describe "index_posts/index", type: :view do
  before(:each) do
    assign(:index_posts, [
      IndexPost.create!(),
      IndexPost.create!()
    ])
  end

  it "renders a list of index_posts" do
    render
  end
end
