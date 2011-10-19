require 'spec_helper'

describe "candidates/show.html.erb" do
  before(:each) do
    @candidate = assign(:candidate, stub_model(Candidate,
      :first_name => "First Name",
      :last_name => "Last Name",
      :resume => "MyText",
      :reference_id => "Reference"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Last Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Reference/)
  end
end
