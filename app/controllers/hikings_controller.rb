class HikingsController < ApplicationController
  before_filter :store_location, :only => [:show]
  # GET /hikings
  # GET /hikings.json
  def index
    @hikings = Hiking.order("name").page(params[:page]).per(10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hikings }
    end
  end

  # GET /hikings/1
  # GET /hikings/1.json
  def show
    @hiking = Hiking.find(params[:id])
    
    @kits = @hiking.kits.page(params[:page]).per(20)
    @kit = @hiking.kits.build
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hiking }
    end
  end

  # GET /hikings/new
  # GET /hikings/new.json
  def new
    @hiking = current_user.hikings.build(params[:hiking])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hiking }
    end
  end

  # GET /hikings/1/edit
  def edit
    @hiking = Hiking.find(params[:id])
  end

  # POST /hikings
  # POST /hikings.json
  def create
    @hiking = current_user.hikings.build(params[:hiking])
    respond_to do |format|
      if @hiking.save
        format.html { redirect_to @hiking, notice: 'Hiking was successfully created.' }
        format.json { render json: @hiking, status: :created, location: @hiking }
      else
        format.html { render action: "new" }
        format.json { render json: @hiking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hikings/1
  # PUT /hikings/1.json
  def update
    @hiking = Hiking.find(params[:id])

    respond_to do |format|
      if @hiking.update_attributes(params[:hiking])
        format.html { redirect_to @hiking, notice: 'Hiking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hiking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hikings/1
  # DELETE /hikings/1.json
  def destroy
    @hiking = Hiking.find(params[:id])
    @hiking.destroy

    respond_to do |format|
      format.html { redirect_to hikings_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def store_location
      session[:return_to] = request.fullpath
  end
end
