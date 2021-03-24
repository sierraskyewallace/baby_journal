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
    #flash.now[:error] = "You must be logged in to do that."
    erb :"posts/new"
  end

  post '/posts' do                                                  
    authenticate_user
    unless Post.valid_params?(params)
      redirect "/posts/new"
    end
    @posts = current_user.posts.create(params)
    @posts.save
    redirect '/posts'
    end


  get "/posts/:id" do
    authenticate_user
    @posts = Post.find_by_id(params[:id])
    erb :'posts/show'
  end

  get "/posts/:id/edit" do        
    authenticate_user 
    @babies = Baby.all
    #flash[:error] = "You must be logged in to do that.""
    @posts = Post.find_by_id(params[:id])
    erb :'posts/edit'
  end

    post "/posts/:id" do           ##clean up and fix so delete doesnt go to show, maybe move delete back to index???
      authenticate_user
      @posts = Post.find(params[:id])
      unless Post.valid_params?(params)
        redirect "/posts/#{@posts.id}/edit"
      end
      @posts = current_user.posts.update(params)
      @posts.save  
      redirect "/posts/#{@posts.id}"
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
  end
end