require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "MongoMapper::Plugins::Lockdown" do

  describe "with a locked document" do
    it "should strip unknown keys on assign" do
      something = Locked.new(:title => "test", :body => "test", :foo => "bar")
      lambda {
        something.foo
      }.should raise_error(NoMethodError)
    end
  end

  describe "with an unlocked document" do
    it "should not strip unlocked keys on assign" do
      something = Unlocked.new(:title => "test", :body => "test", :foo => "bar")
      something.foo.should == "bar"
    end
  end

end
