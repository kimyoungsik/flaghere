class HikingparticipationsController < ApplicationController
  def create
    @hikingparticipation = current_user.hikingparticipations.build(params[:hikingparticipation])
    @hiking = @hikingparticipation.hiking
    if @hikingparticipation.save
      respond_to do |format|
        format.html { redirect_to @hiking}
        format.js
      end
    else 
      redirect_to @hiking
    end 
  end
  
  
  def destroy
    @hikingparticipation = Hikingparticipation.find(params[:id])       
    @hiking = @hikingparticipation.hiking
    if @hikingparticipation.destroy
      respond_to do |format|
        format.html { redirect_to @hiking }
        format.js
      end
    else
      redirect_to hiking_path(@hiking)
    end
  end
end
