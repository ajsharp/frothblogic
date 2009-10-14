class Post < ActiveRecord::Base
  validates_presence_of :title, :body

  make_permalink :with => :title
end
