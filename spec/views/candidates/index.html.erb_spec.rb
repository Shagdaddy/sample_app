require 'spec_helper'

describe "candidates/index.html.erb" do
  before(:each) do
    assign(:candidates, [
      stub_model(Candidate,
        :first_name => "First Name",
        :last_name => "Last Name",
        :resume => "MyText",
        :reference_id => "Reference"
      ),
      stub_model(Candidate,
        :first_name => "First Name",
        :last_name => "Last Name",
        :resume => "MyText",
        :reference_id => "Reference"
      )
    ])
  end

  it "renders a list of candidates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Reference".to_s, :count => 2
  end
end
