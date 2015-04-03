require 'rails_helper'

RSpec.describe "foos/new", type: :view do
  before(:each) do
    assign(:foo, Foo.new(
      :text => "MyString",
      :user => nil
    ))
  end

  it "renders new foo form" do
    render

    assert_select "form[action=?][method=?]", foos_path, "post" do

      assert_select "input#foo_text[name=?]", "foo[text]"

      assert_select "input#foo_user_id[name=?]", "foo[user_id]"
    end
  end
end
