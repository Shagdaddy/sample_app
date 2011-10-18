require 'spec_helper'

describe "companies/show.html.erb" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :name => "Name",
      :abbr => "Abbr",
      :jobcount => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Abbr/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
