class PostsController < ApplicationController

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


  get "/posts/new" do
    redirect_if_not_logged_in
    @babies = Baby.all
    @babies = current_user.babies
    #flash[:error] = "You must be logged in to create a post."
    erb :"posts/new"
  end

  post '/posts' do 
    redirect_if_not_logged_in
    unless Post.valid_params?(params)
      redirect "/posts/new"     ##change to flash error
    end

    @posts = babies.posts.create(params)
    @posts.save
    redirect '/posts'
end

  get "/posts/:id" do
    redirect_if_not_logged_in
    @posts = Post.find_by_id(params[:id])
    erb :'posts/show'
  end

  get "/posts/:id/edit" do
    redirect_if_not_logged_in 
    #flash.now[:error] = "You must be logged in to do that."  ##bootstrap
    @posts = Post.find_by_id(params[:id])
    erb :'posts/edit'
  end

    patch "/posts/:id" do
      redirect_if_not_logged_in
      @posts = Post.find(params[:id])
      unless Post.valid_params?(params)
        redirect "/posts/#{@posts.id}/edit"
      end
      @posts.update(height: params[:height], weight: params[:weight], summary: params[:summary])
      redirect "/posts/#{@posts.id}"
    end

  delete '/posts/:id/delete' do
    if logged_in?
      @posts = Post.find_by_id(params[:id])
      if @posts && @posts.user == current_user
        @posts.delete
        redirect "/posts"
      else
        redirect "/login"
      end
    end
  end
end