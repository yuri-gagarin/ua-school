require 'rails_helper'

RSpec.describe "index_posts/show", type: :view do
  before(:each) do
    @index_post = assign(:index_post, IndexPost.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
