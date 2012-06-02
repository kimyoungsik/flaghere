class ParticipationsController < ApplicationController
  def create
    @participation = current_user.participations.build(params[:participation])
    @flag = @participation.flag
    if @participation.save
      respond_to do |format|
        format.html { redirect_to @flag}
        format.js
      end
    else 
      redirect_to @flag
    end 
  end
  
  
  def destroy
    @participation = Participation.find(params[:id])       
    @flag = @participation.flag
    if @participation.destroy
      respond_to do |format|
        format.html { redirect_to @flag }
        format.js
      end
    else
      redirect_to flag_path(@flag)
    end
  end
end
