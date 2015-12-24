require 'spec_helper'

describe "Blog Post App" do
  let(:post_name) { "Hello World" }
  let(:post_content) { "This is my first blog post!!!" }

  before do
    @post1 = Post.create(:name => post_name, :content => post_content)
    @post2 = Post.create(:name => "second post", :content => "i'm a really good blogger")
  end

  describe "Create Action" do 

    it "creates a new blog post" do
      visit '/posts/new'

      fill_in :name, :with => "my favorite blog post"
      fill_in :content, :with => "blogging!!!!"

      click_button 'Submit'

      expect(Post.all.count).to eq(3)
      expect(Post.last.name).to eq("my favorite blog post")
    end

  end

  describe "Read Action " do
    describe 'index action' do 
      it 'responds with a 200 status code' do
        get "/posts"
        expect(last_response.status).to eq(200)
      end

      it "displays all the blog posts" do
        get "/posts"
        expect(last_response.body).to include(post_name)
        expect(last_response.body).to include(@post2.name)
      end
    end

    describe 'show action' do 
      it 'show page responds with a 200 status code' do
        get "/posts/#{@post1.id}"
        expect(last_response.status).to eq(200)
      end

      it "show page displays the post's name" do
        get "/posts/#{@post1.id}"
        expect(last_response.body).to include(post_name)
      end

      it "show page displays the post's content" do
        get "/posts/#{@post1.id}"
        expect(last_response.body).to include(post_content)
      end
    end

   
  end


  describe "update action" do


    it 'responds with a 200 status code' do
      get "/posts/#{@post2.id}/edit"
      expect(last_response.status).to eq(200)
    end

    it 'displays the existing object in the edit form' do 
      visit "/posts/#{@post2.id}/edit"
      expect(page.body).to include("#{@post2.name}")
      expect(page.body).to include("#{@post2.content}")

    end

    it "saves edits to a blog post" do
      visit "/posts/#{@post2.id}/edit"
      fill_in :name, :with => "Second Post!!"
      fill_in :content, :with => "this is the best blog post ever written"

      click_button 'Submit'
      expect(Post.all.count).to eq(2)
      expect(Post.last.name).to eq("Second Post!!")
    end

  end

  describe "delete action" do


    it 'responds with a 200 status code' do
      get "/posts/#{@post2.id}/delete"
      expect(last_response.status).to eq(200)
    end

    it "deletes a blog post from the database" do
      visit "/posts/#{@post2.id}/delete"
      click_button "Delete"
      expect(Post.all.count).to eq(1)
      expect(Post.last.name).to eq("Hello World")
    end

  end

  



    
end
