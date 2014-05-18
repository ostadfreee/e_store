require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :name => "MyString",
      :product_serial => 1,
      :price => "9.99",
      :discount => "9.99",
      :unite => 1
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", products_path, "post" do
      assert_select "input#product_name[name=?]", "product[name]"
      assert_select "input#product_product_serial[name=?]", "product[product_serial]"
      assert_select "input#product_price[name=?]", "product[price]"
      assert_select "input#product_discount[name=?]", "product[discount]"
      assert_select "input#product_unite[name=?]", "product[unite]"
    end
  end
end
