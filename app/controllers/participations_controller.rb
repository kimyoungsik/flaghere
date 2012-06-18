#encoding:utf-8
class ParticipationsController < ApplicationController
  def create
    @participation = current_user.participations.build(params[:participation])
    @flag = @participation.flag
    if @participation.save
      if current_user.facebook_uid and current_user.facebook_connect
        @graph.put_wall_post("정상등반을 성공하였습니다! 축하해주세요~ with 망고마운틴", {
          :name => @flag.name, 
          :picture => request.protocol + request.host + @participation.picture.url,
          :link => request.protocol + request.host + flag_path(@flag),
          :caption => @participation.user.nickname,
          :description => "#{@participation.date.strftime("%Y년 %m월 %d일")}-#{@participation.note}" })
      end
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
