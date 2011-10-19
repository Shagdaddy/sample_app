require 'spec_helper'

describe "candidates/edit.html.erb" do
  before(:each) do
    @candidate = assign(:candidate, stub_model(Candidate,
      :first_name => "MyString",
      :last_name => "MyString",
      :resume => "MyText",
      :reference_id => "MyString"
    ))
  end

  it "renders the edit candidate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => candidates_path(@candidate), :method => "post" do
      assert_select "input#candidate_first_name", :name => "candidate[first_name]"
      assert_select "input#candidate_last_name", :name => "candidate[last_name]"
      assert_select "textarea#candidate_resume", :name => "candidate[resume]"
      assert_select "input#candidate_reference_id", :name => "candidate[reference_id]"
    end
  end
end
