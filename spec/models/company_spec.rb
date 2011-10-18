require 'spec_helper'

describe Company do

    before(:each) do
    @attr = {
      :name => "value for content"}
  end

  it "should create a new instance given valid attributes" do
    Company.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @company = Company.create(@attr)
    end

    it "should have a microposts attribute" do
      @company.should respond_to(:users)
    end
  end

#  pending "add some examples to (or delete) #{__FILE__}"
end
