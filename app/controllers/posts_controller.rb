class PostsController < ApplicationController

  # GET: /posts
  get '/posts' do
    redirect_if_not_logged_in
    @posts = Post.all
    if logged_in?
      @user = current_user
      @posts = current_user.posts
    erb :'/posts/index'
    else 
      redirect '/login'
  end
end

  # GET: /posts/new
  get "/posts/new" do
    redirect_if_not_logged_in
    flash[:error] = "You must be logged in to create a post."
    erb :"posts/new"
  end

  # POST: /posts
  post '/posts' do 
    redirect_if_not_logged_in
    unless Post.valid_params?(params)
      redirect "/posts/new?error=No Posts Here!"
    end
    @posts = current_user.posts.create(params)
    redirect '/updates'
end


  

  # GET: /posts/5
  get "/posts/:id" do
    redirect_if_not_logged_in
    @posts = Post.find_by_id(params[:id])
    erb :'posts/show'
  end

  # GET: /posts/5/edit
  get "/posts/:id/edit" do
    redirect_if_not_logged_in 
    @error_message = params[:error]
    @posts = Post.find(params[:id])
    erb :'posts/edit'
  end

  # PATCH: /posts/5
  post "/posts/:id" do
    redirect_if_not_logged_in 
    @posts = Post.find(params[:id])
    unless Post.valid_params?(params)
      redirect "/posts/#{@post.id}/edit?error=No Posts Here!"
    end
    @posts.Post(params.select{|p|p=="weight" || p=="height" || p=="baby_id"})
    redirect "/posts/#{@post.id}"
  end

  # DELETE: /posts/5/delete
  delete '/posts/:id/delete' do
    if logged_in?
        @posts = Post.find_by_id(params[:id])
          @posts.delete 
       else 
        redirect '/login'
    end
    redirect '/posts'
end
end
