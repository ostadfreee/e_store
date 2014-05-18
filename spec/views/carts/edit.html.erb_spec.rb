require 'spec_helper'

describe "carts/edit" do
  before(:each) do
    @cart = assign(:cart, stub_model(Cart,
      :credit_number => 1,
      :credit_pin => 1
    ))
  end

  it "renders the edit cart form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cart_path(@cart), "post" do
      assert_select "input#cart_credit_number[name=?]", "cart[credit_number]"
      assert_select "input#cart_credit_pin[name=?]", "cart[credit_pin]"
    end
  end
end
