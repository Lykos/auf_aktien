# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'code/model/account.rb'

describe Model::Account do
  before(:each) do
    @balance = 23
    @account = Model::Account.new(@balance)
  end

  describe "after creation" do
    it "should have the balance we specified" do
      @account.balance.should == @balance
    end

    it "should have the balance 0 if we specified so." do
      Model::Account.new(0).balance.should == 0
    end

    it "should raise an exception when initialized with a nonnumeric balance" do
      lambda {
        Model::Account.new("Hi")
      }.should raise_error ArgumentError
    end

    it "should raise an exception when initialized with a noninteger balance" do
      lambda {
        Model::Account.new(2.2)
      }.should raise_error ArgumentError
    end

    it "should raise an exception when initialized with a negative balance" do
      lambda {
        Model::Account.new(2.2)
      }.should raise_error ArgumentError
    end
  end

  describe "in any situation" do
    it "should be able to pay a price smaller than its balance" do
      @account.can_pay?(@balance - 1).should be_true
    end

    it "should be able to pay a price equal to its balance" do
      @account.can_pay?(@balance).should be_true
    end

    it "shouldn't be able to pay a price bigger than its balance" do
      @account.can_pay?(@balance + 1).should be_false
    end

    it "should subtract the price it pays from the balance" do
      @account.pay! 12
      @account.balance.should == (@balance - 12)
    end

    it "should set the balance to zero if it pays a price equal to the balance" do
      @account.pay! @balance
      @account.balance.should == 0
    end

    it "should add the money it receives to the balance" do
      @account.receive! 12
      @account.balance.should == (@balance + 12)
    end
  end

  describe "after forbidden operations" do
    it "should raise an exception when it pays a nonumeric value." do
      lambda {
        @account.pay! "price"
      }.should raise_error ArgumentError
    end

    it "should raise an exception when it receives a nonumeric value" do
      lambda {
        @account.receive! "price"
      }.should raise_error ArgumentError
    end

    it "should raise an exception when it is asked if it can pay a nonumeric value" do
      lambda {
        @account.can_pay? "price"
      }.should raise_error ArgumentError
    end

    it "should raise an exception when it pays a noninteger value." do
      lambda {
        @account.pay! 2.2
      }.should raise_error ArgumentError
    end

    it "should raise an exception when it receives a noninteger value" do
      lambda {
        @account.receive! 2.2
      }.should raise_error ArgumentError
    end
    
    it "should raise an exception when it is asked if it can pay a noninteger value" do
      lambda {
        @account.can_pay? 2.2
      }.should raise_error ArgumentError
    end

    it "should raise an exception when it pays a negative value." do
      lambda {
        @account.pay! -2
      }.should raise_error ArgumentError
    end

    it "should raise an exception when it receives a negeative value" do
      lambda {
        @account.receive! -2
      }.should raise_error ArgumentError
    end

    it "should raise an exception when it is asked if it can pay a negative value" do
      lambda {
        @account.can_pay? -2
      }.should raise_error ArgumentError
    end

    it "should raise an exception when it pays a value bigger than its balance" do
      lambda {
        @account.pay! @balance + 2
      }.should raise_error ArgumentError
    end
  end
end
