require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post do
  describe "a valid Post" do
    before(:each) do
      @post = Factory(:post)
    end

    it { should validate_presence_of :title }
    it { should validate_presence_of :body }

    context "permalink creation" do
      before(:each) do
        @post1 = Factory(:post, :title => "Post Title")
        @post1.should be_valid
        @post1.permalink.should == "post-title"

        @post2 = Factory.build(:post, :title => "Post Title")
      end

      it "post2 should be valid with same title as first post" do
        @post2.should be_valid
      end
      
      it "post 2 should save successfully" do
        @post2.save.should be_true
      end

      it "post 2 should have a different permalink than post 1" do
        @post2.save
        @post2.permalink.should_not == @post1.permalink
      end

      it "post 2 permalink should equal post-title-1" do
        @post2.save
        @post2.permalink.should == "post-title-1"
      end
    end

    context "factories" do
      it "should have valid factories" do
        [:post].each do |f|
          Factory.build(f).should be_valid
          Factory(f).save.should be_true
        end
      end
    end

  end
end
