require 'rails_helper'

RSpec.describe "foos/edit", type: :view do
  before(:each) do
    @foo = assign(:foo, Foo.create!(
      :text => "MyString",
      :user => nil
    ))
  end

  it "renders the edit foo form" do
    render

    assert_select "form[action=?][method=?]", foo_path(@foo), "post" do

      assert_select "input#foo_text[name=?]", "foo[text]"

      assert_select "input#foo_user_id[name=?]", "foo[user_id]"
    end
  end
end
