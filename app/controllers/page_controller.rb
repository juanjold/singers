class PageController < ApplicationController
    def home
    @posts = Post.all(:order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
  
   def company
    @singers = Singer.all
    if !params[:scope].nil?
      @singers = Singer.send(params[:scope])
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @singers }
    end
  end
end
