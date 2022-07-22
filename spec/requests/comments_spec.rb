RSpec.describe CommentsController, :type => :controller do
  before :each do
    @post = FactoryBot.build(:post)
  end
  describe '#Create comment' do
      it 'creates a comment' do
        comment = create(:comment)
        @post.comments << comment
        expect{post :create, params: {comment: {id: comment.id, body: "dsfsdgsdg"}, post_id: @post.id}}.
        to change{@post.comments.count}.by(1)
        expect(response).to redirect_to(post_path(@post))
      end
    end


  describe '#DELETE destroy' do
      it 'deletes a comment' do
        comment = create(:comment)
        @post.comments << comment
        expect{delete :destroy, params: {id: comment.id,body: "dsfsdgsdg", post_id: @post.id}}.
        to change{@post.comments.count}.by(-1)        
        expect(response).to redirect_to(post_path(@post))
      end
    end

 
end