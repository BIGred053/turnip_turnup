require 'rails_helper'

RSpec.describe "islands/show", type: :view do
  before(:each) do
    @island = assign(:island, Island.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
