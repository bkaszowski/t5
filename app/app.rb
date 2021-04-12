require_relative 'comment'
require_relative 'comment_serializer'

# Comment = Struct.new(:id, :body)
c1 = Comment.new(1, "Hello World")
s = CommentSerializer.new(c1)
puts s.serialize
