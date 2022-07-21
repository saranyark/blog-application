RSpec.describe CommentsController, :type => :controller do
   
    describe '#Create comment' do
        it 'creates a comment' do
          expect{post :create, params: {comment: {id: comment.id, body: "dsfsdgsdg"}}}.
          to change{@post.comments.count}.by(1)
          expect(response).to redirect_to(post_path(@post))
        end
      end
   
end