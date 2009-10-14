require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Admin::PostsController do
  describe "GET /admin/posts/new" do
    before(:each) do
      get :new
    end

    it { should respond_with    :success }
    it { should assign_to       :post }
    it { should render_template :new }
    it { should route(:get, "/admin/posts/new").to(:controller => "admin/posts", :action => :new) }
  end

  describe "POST /admin/posts" do
    before(:each) do
      lambda { 
        post :create, :post => { :title => "Post Title", :body => "Body" }
      }.should change(Post, :count)
    end

    it { should respond_with    :redirect }
    it { should set_the_flash }
    it { should route(:post, "/admin/posts").to(:controller => "admin/posts", :action => :create) }

    it "should redirect to /admin/posts/show.html.haml" do
      response.should redirect_to admin_post_url(Post.last)
    end
  end

  describe "GET /admin/posts/post-title" do
    before(:each) do
      @post = Factory(:post)
      get :show, :id => @post.permalink
    end

    it { should respond_with    :success }
    it { should assign_to       :post }
    it { should render_template :show }
    it { should route(:get, "/admin/posts/post-title").to(:controller => "admin/posts", :action => :show, :id => "post-title") }
  end

end
