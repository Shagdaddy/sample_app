require 'spec_helper'

describe "candidates/new.html.erb" do
  before(:each) do
    assign(:candidate, stub_model(Candidate,
      :first_name => "MyString",
      :last_name => "MyString",
      :resume => "MyText",
      :reference_id => "MyString"
    ).as_new_record)
  end

  it "renders new candidate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => candidates_path, :method => "post" do
      assert_select "input#candidate_first_name", :name => "candidate[first_name]"
      assert_select "input#candidate_last_name", :name => "candidate[last_name]"
      assert_select "textarea#candidate_resume", :name => "candidate[resume]"
      assert_select "input#candidate_reference_id", :name => "candidate[reference_id]"
    end
  end
end
