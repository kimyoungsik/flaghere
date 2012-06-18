class HikingtypesController < ApplicationController
  # GET /hikingtypes
  # GET /hikingtypes.json
  # before_filter :admin_user
  def index
    @hikingtypes = Hikingtype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hikingtypes }
    end
  end

  # GET /hikingtypes/1
  # GET /hikingtypes/1.json
  def show
    @hikingtype = Hikingtype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hikingtype }
    end
  end

  # GET /hikingtypes/new
  # GET /hikingtypes/new.json
  def new
    @hikingtype = Hikingtype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hikingtype }
    end
  end

  # GET /hikingtypes/1/edit
  def edit
    @hikingtype = Hikingtype.find(params[:id])
  end

  # POST /hikingtypes
  # POST /hikingtypes.json
  def create
    @hikingtype = Hikingtype.new(params[:hikingtype])

    respond_to do |format|
      if @hikingtype.save
        format.html { redirect_to @hikingtype, notice: 'Hikingtype was successfully created.' }
        format.json { render json: @hikingtype, status: :created, location: @hikingtype }
      else
        format.html { render action: "new" }
        format.json { render json: @hikingtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hikingtypes/1
  # PUT /hikingtypes/1.json
  def update
    @hikingtype = Hikingtype.find(params[:id])

    respond_to do |format|
      if @hikingtype.update_attributes(params[:hikingtype])
        format.html { redirect_to @hikingtype, notice: 'Hikingtype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hikingtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hikingtypes/1
  # DELETE /hikingtypes/1.json
  def destroy
    @hikingtype = Hikingtype.find(params[:id])
    @hikingtype.destroy

    respond_to do |format|
      format.html { redirect_to hikingtypes_url }
      format.json { head :no_content }
    end
  end
  
  private 
  
  def admin_user
    unless admin_signed_in?
      redirect_to root_path
    end
  end
end
