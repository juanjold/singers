class SingersController < ApplicationController
  # GET /singers
  # GET /singers.json
  before_filter :authenticate_admin!

  VOICEPARTS = ['Soprano', 'Alto', 'Tenor', 'Base']
  SKILLS = ['Painting', 'Hammering', 'Screwing' ]
  STATS = ['Performing', 'Tech', 'PTech']

  def index
    @singers = Singer.all
    if !params[:scope].nil?
      @singers = Singer.send(params[:scope])
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @singers }
    end
  end

  def performing
    @singers = Singer.performing
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @singers }
    end
  end

  # GET /singers/1
  # GET /singers/1.json
  def show
    @singer = Singer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @singer }
    end
  end

  # GET /singers/new
  # GET /singers/new.json
  def new
    @singer = Singer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @singer }

    end
  end

  # GET /singers/1/edit
  def edit
    @singer = Singer.find(params[:id])
  end

  # POST /singers
  # POST /singers.json
  def create
    @singer = Singer.new(params[:singer])

    respond_to do |format|
      if @singer.save
        Notifications.new_singer(@singer).deliver
        format.html { redirect_to @singer, notice: 'Singer was successfully created.' }
        format.json { render json: @singer, status: :created, location: @singer }
      else
        format.html { render action: "new" }
        format.json { render json: @singer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /singers/1
  # PUT /singers/1.json
  def update
    @singer = Singer.find(params[:id])

    respond_to do |format|
      if @singer.update_attributes(params[:singer])
        Notifications.update_singer(@singer).deliver
        format.html { redirect_to @singer, notice: 'Singer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @singer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /singers/1
  # DELETE /singers/1.json
  def destroy
    @singer = Singer.find(params[:id])
    @singer.destroy

    respond_to do |format|
      format.html { redirect_to singers_url }
      format.json { head :no_content }
    end
  end
end
