require 'spec_helper'

describe "carts/index" do
  before(:each) do
    assign(:carts, [
      stub_model(Cart,
        :credit_number => 1,
        :credit_pin => 2
      ),
      stub_model(Cart,
        :credit_number => 1,
        :credit_pin => 2
      )
    ])
  end

  it "renders a list of carts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
