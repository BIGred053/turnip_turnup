require 'rails_helper'

RSpec.describe "islands/index", type: :view do
  before(:each) do
    assign(:islands, [
      Island.create!(),
      Island.create!()
    ])
  end

  it "renders a list of islands" do
    render
  end
end
