require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates the post' do
        post :create, post: form_for(:post)
        expect(Post.count).to eq(1)
      end

      it 'redirects to the "show" action for the new post' do
        post :create, post: attributes_for(:post)
        expect(response).to redirect_to Post.first
      end
    end

    context 'with invalid attributes' do
      it 'does not create the post' do
        post :create, post: attributes_for(:title, body: nil)
        expect(Post.count).to eq(0)
      end

      it 're-renders the "new" view' do
        post :create, post: attributes_for(:title, body: nil)
        expect(response).to render_template :new
      end
    end
  end
end
