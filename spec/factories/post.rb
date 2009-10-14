Factory.sequence :title do |n|
  "Post Title #{n}"
end

Factory.define :post do |f|
  f.title { Factory.next(:title) }
  f.body  "Post body"
end
