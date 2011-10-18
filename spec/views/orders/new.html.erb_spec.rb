require 'spec_helper'

describe "orders/new.html.erb" do
  before(:each) do
    assign(:order, stub_model(Order,
      :order_id => "MyString",
      :user_id => 1,
      :job_title => "MyString",
      :job_type => "MyString",
      :location => "MyString",
      :description => "MyString",
      :position_max => 1,
      :positions_filled => 1,
      :stage => 1
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path, :method => "post" do
      assert_select "input#order_order_id", :name => "order[order_id]"
      assert_select "input#order_user_id", :name => "order[user_id]"
      assert_select "input#order_job_title", :name => "order[job_title]"
      assert_select "input#order_job_type", :name => "order[job_type]"
      assert_select "input#order_location", :name => "order[location]"
      assert_select "input#order_description", :name => "order[description]"
      assert_select "input#order_position_max", :name => "order[position_max]"
      assert_select "input#order_positions_filled", :name => "order[positions_filled]"
      assert_select "input#order_stage", :name => "order[stage]"
    end
  end
end
