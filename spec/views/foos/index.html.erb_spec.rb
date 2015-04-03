require 'rails_helper'

RSpec.describe "foos/index", type: :view do
  before(:each) do
    assign(:foos, [
      Foo.create!(
        :text => "Text",
        :user => nil
      ),
      Foo.create!(
        :text => "Text",
        :user => nil
      )
    ])
  end

  it "renders a list of foos" do
    render
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
