require 'spec_helper'

describe "companies/edit.html.erb" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :name => "MyString",
      :abbr => "MyString",
      :jobcount => 1
    ))
  end

  it "renders the edit company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => companies_path(@company), :method => "post" do
      assert_select "input#company_name", :name => "company[name]"
      assert_select "input#company_abbr", :name => "company[abbr]"
      assert_select "input#company_jobcount", :name => "company[jobcount]"
    end
  end
end
