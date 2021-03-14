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
    flash[:error] = "You must be logged in to create a post."
    erb :"posts/new"
  end

  post '/posts' do 
    redirect_if_not_logged_in
    unless Post.valid_params?(params)
      redirect "/posts/new?error=No Posts Here!"
    end
    @posts = current_user.posts.create(params)
    redirect '/posts'
end

  get "/posts/:id" do
    redirect_if_not_logged_in
    @posts = Post.find_by_id(params[:id])
    erb :'posts/show'
  end

  get "/posts/:id/edit" do
    redirect_if_not_logged_in 
    @error_message = params[:error]
    @posts = Post.find_by_id(params[:id])
    erb :'posts/edit'
  end

    patch "/posts/:id" do
      redirect_if_not_logged_in
      @posts = Post.find(params[:id])
      unless Post.valid_params?(params)
        redirect "/posts/#{@posts.id}/edit?error=No Posts Here"
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