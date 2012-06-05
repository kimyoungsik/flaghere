class FlagsController < ApplicationController
  before_filter :store_location, :only => [:show]

  # GET /flags
  # GET /flags.json
  def index
    @flags = Flag.search(params[:search]).order("id").page(params[:page]).per(10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flags }
    end
  end

  # GET /flags/1
  # GET /flags/1.json
  def show
    @flag = Flag.find(params[:id])
    @kits = @flag.kits.page(params[:page]).per(10)
    @kit = @flag.kits.build
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flag }
    end
  end

  # GET /flags/new
  # GET /flags/new.json
  def new
    @flag = current_user.flags.build(params[:flag])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @flag }
    end
  end

  # GET /flags/1/edit
  def edit
    @flag = Flag.find(params[:id])
  end

  # POST /flags
  # POST /flags.json
  def create
    @flag = current_user.flags.build(params[:flag])

    respond_to do |format|
      if @flag.save
        format.html { redirect_to @flag, notice: 'Flag was successfully created.' }
        format.json { render json: @flag, status: :created, location: @flag }
      else
        format.html { render action: "new" }
        format.json { render json: @flag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /flags/1
  # PUT /flags/1.json
  def update
    @flag = Flag.find(params[:id])

    respond_to do |format|
      if @flag.update_attributes(params[:flag])
        format.html { redirect_to @flag, notice: 'Flag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @flag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flags/1
  # DELETE /flags/1.json
  def destroy
    @flag = Flag.find(params[:id])
    @flag.destroy

    respond_to do |format|
      format.html { redirect_to flags_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def store_location
      session[:return_to] = request.fullpath
  end
  

end
