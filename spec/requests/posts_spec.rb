RSpec.describe 'Posts', type: :request do
  let(:valid_attributes) do{      
    'title'=> 'post',
    'description'=> 'post description'
  }
  end

  let(:invalid_attributes) do{
  'title'=> '',
  'description'=> ''
  }
  end
  describe "GET /index" do
      it "assigns all posts to @posts" do
        get posts_path
        expect(assigns(:posts)).to eq(Post.all)
      end
  end
  describe "GET /new" do
      it "display new form" do
        get new_post_url
        expect(response).to be_successful
      end
  end
  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new post" do
        expect {
          post posts_url, params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
      end
  
      it "redirects to the created post" do
        post posts_url, params: { post: valid_attributes }
        expect(response).to redirect_to(post_path(assigns[:post]))
      end
    end   
    context "with invalid parameters" do
      it "does not create a new post" do
        expect {
          post posts_url, params: { post: invalid_attributes }
        }.to change(Post, :count).by(0)
      end
    
      it "doesn't render the 'show' template and display error " do
        post posts_url, params: { post: invalid_attributes }
        expect(response.status).to eq 422
        get new_post_url
        expect(response).to_not render_template(:show) 
      end
    end
  end
 describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do{
        'title'=> 'post1',
        'description'=> 'post description1'
           }
      end
      it "updates the requestedpost" do
       post = Post.create! valid_attributes
        patch post_url(post), params: {post: new_attributes }
       post.reload  
      end
  
      it "redirects to thepost" do
       post = Post.create! valid_attributes
        patch post_url(post), params: {post: new_attributes }
       post.reload
        expect(response).to redirect_to(post_url(post))
      end
    end
  
    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
       post = Post.create! valid_attributes
        patch post_url(post), params: {post: invalid_attributes }
        expect(response.status).to eq 422
        expect(response).to_not render_template(:show)
      end
    end
  end
  describe "DELETE /destroy" do
    it "destroys the requested post" do
      post = Post.create! valid_attributes
      expect {
        delete post_url(post)
      }.to change(Post, :count).by(-1)
    end
  
    it "redirects to the posts list" do
      post = Post.create! valid_attributes
      delete post_url(post)
      expect(response).to redirect_to(posts_url)
    end
  end
 end