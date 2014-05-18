require 'spec_helper'

describe "carts/show" do
  before(:each) do
    @cart = assign(:cart, stub_model(Cart,
      :credit_number => 1,
      :credit_pin => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
