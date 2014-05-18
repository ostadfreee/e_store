require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Order,
      :name => "MyString",
      :order_number => 1,
      :sum => "9.99"
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", orders_path, "post" do
      assert_select "input#order_name[name=?]", "order[name]"
      assert_select "input#order_order_number[name=?]", "order[order_number]"
      assert_select "input#order_sum[name=?]", "order[sum]"
    end
  end
end
