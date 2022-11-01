require 'rails_helper'

RSpec.describe 'Posts', type: :system, js: true do
  describe 'index page' do
    before(:example) do
      @user = User.create(name: 'Tom', 
        photo: 'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80' , 
        bio: 'Teacher from Mexico', posts_counter: 0 );
      
      @post1 = Post.create(author: @user, title: 'Timmy Jimmy', text: 'Hey Jimmy jimmy', likes_counter: 0,
          comments_counter: 0);
      
      @post2 = Post.create(author: @user, title: 'Alan Luqman', text: 'This is awesome', likes_counter: 0,
          comments_counter: 0);
      @post3 = Post.create(author: @user, title: 'Alan', text: 'Great guy', likes_counter: 0,
          comments_counter: 0);

      @comment1 = Comment.create(author: @user, post: @post2, text: 'this is comment')
      @comment3 = Comment.create(author: @user, post: @post1, text: 'Hi guys')
      @comment4 = Comment.create(author: @user, post: @post1, text: 'hey')
      @comment5 = Comment.create(author: @user, post: @post1, text: 'hey')

      visit user_posts_path(@user)
    end

    it "I can see user's profile picture" do
      find("img[src='#{@user.photo}']")
    end

  end
end