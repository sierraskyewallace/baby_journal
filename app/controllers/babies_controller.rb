class BabiesController < ApplicationController

  # GET: /babies
  get "/babies" do
    erb :"/babies/index.html"
  end

  # GET: /babies/new
  get "/babies/new" do
    erb :"/babies/new.html"
  end

  # POST: /babies
  post "/babies" do
    redirect "/babies"
  end

  # GET: /babies/5
  get "/babies/:id" do
    erb :"/babies/show.html"
  end

  # GET: /babies/5/edit
  get "/babies/:id/edit" do
    erb :"/babies/edit.html"
  end

  # PATCH: /babies/5
  patch "/babies/:id" do
    redirect "/babies/:id"
  end

  # DELETE: /babies/5/delete
  delete "/babies/:id/delete" do
    redirect "/babies"
  end
end
