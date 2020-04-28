require 'rails_helper'

RSpec.describe "islands/new", type: :view do
  before(:each) do
    assign(:island, Island.new())
  end

  it "renders new island form" do
    render

    assert_select "form[action=?][method=?]", islands_path, "post" do
    end
  end
end
