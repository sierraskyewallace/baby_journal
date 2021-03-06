class UpdatesController < ApplicationController

  # GET: /updates
  get "/updates" do
    erb :"/updates/index.html"
  end

  # GET: /updates/new
  get "/updates/new" do
    erb :"/updates/new.html"
  end

  # POST: /updates
  post "/updates" do
    redirect "/updates"
  end

  # GET: /updates/5
  get "/updates/:id" do
    erb :"/updates/show.html"
  end

  # GET: /updates/5/edit
  get "/updates/:id/edit" do
    erb :"/updates/edit.html"
  end

  # PATCH: /updates/5
  patch "/updates/:id" do
    redirect "/updates/:id"
  end

  # DELETE: /updates/5/delete
  delete "/updates/:id/delete" do
    redirect "/updates"
  end
end
