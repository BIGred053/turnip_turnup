require 'rails_helper'

RSpec.describe "islands/edit", type: :view do
  before(:each) do
    @island = assign(:island, Island.create!())
  end

  it "renders the edit island form" do
    render

    assert_select "form[action=?][method=?]", island_path(@island), "post" do
    end
  end
end
