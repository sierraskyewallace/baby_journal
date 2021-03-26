class PostsController < ApplicationController

  get '/posts' do
    authenticate_user
    @posts = Post.all
    if logged_in?
      @user = current_user
      @posts = current_user.posts
    erb :'/posts/index'
    else 
      redirect '/login'
  end
end


  get "/posts/new" do
    authenticate_user
    @babies = Baby.all
    erb :"posts/new"
  end

  post '/posts' do                                                  
    authenticate_user
    @posts = Post.find_by_id(params[:id])
    if logged_in?
     @posts = current_user.posts.create(params)
     @posts.save 
     redirect "/posts"
    else 
      redirect "posts/new"
    end
  end
end

  get "/posts/:id" do
    authenticate_user
    @posts = Post.find_by_id(params[:id])
    erb :'posts/show'
  end

  get '/posts/:id/edit' do        
    authenticate_user 
    @babies = Baby.all
    @posts = Post.find_by_id(params[:id])
    erb :'posts/edit'
  end

    post "/posts/:id" do         
      authenticate_user
      if logged_in?
        @posts.current_user.posts.update(params)
        @posts.save 
        redirect "posts/#{@posts.id}"
       else 
         redirect "posts/new"
       end
     end
    end

  
  delete '/posts/:id/delete' do
    if logged_in?
      @posts = Post.find_by_id(params[:id])
      if @posts && @posts.user == current_user
        @posts.delete
        redirect '/posts'
      else
        redirect '/login'
      end
    end
