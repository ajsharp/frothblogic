require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Admin::PostsController do
  describe "GET /admin/posts/new" do
    before(:each) do
      get :new
    end

    it "should render new.html.haml" do
      response.should render_template "new.html.haml"
    end

    it "should assign the @post instance variable" do
      assigns[:post].should_not be_nil
    end

    it "should route to /admin/posts/new" do
      route_for(:controller => "admin/posts", :action => "new").should == "/admin/posts/new"
    end
  end

  describe "POST /admin/posts" do
    before(:each) do
      lambda { 
        post :create, :post => { :title => "Post Title", :body => "Body" }
      }.should change(Post, :count)
      @post = Post.last
    end

    it "should redirect to /admin/posts/show.html.haml" do
      response.should redirect_to admin_post_url(@post)
    end

    it "should route POST create to /admin/posts" do
      route_for(:controller => "admin/posts", :action => "create").should == { :path => "/admin/posts", :method => :post }
    end
  end

  describe "GET /admin/posts/post-title" do
    before(:each) do
      @post = Factory(:post)
      get :show, :id => @post.permalink
    end

    it { should respond_with(:success) }
    it { should assign_to :post }
    it { should route(:get, "/admin/posts/post-title").to(:controller => "admin/posts", :action => :show, :id => "post-title") }

    it "should render the show template" do
      response.should render_template "admin/posts/show.html.haml"
    end

  end

end
