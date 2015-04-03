require 'rails_helper'

RSpec.describe "foos/show", type: :view do
  before(:each) do
    @foo = assign(:foo, Foo.create!(
      :text => "Text",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text/)
    expect(rendered).to match(//)
  end
end
