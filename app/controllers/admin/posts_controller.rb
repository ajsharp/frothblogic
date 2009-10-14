class Admin::PostsController < AdminController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    
    if @post.save
      flash[:notice] = "Post created successfully!"
      redirect_to [:admin, @post]
    else
      render :action => "new"
    end
  end

  def show
    @post = Post.find_by_param params[:id]
  end
end
