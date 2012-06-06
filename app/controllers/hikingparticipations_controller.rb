#encoding:utf-8
class HikingparticipationsController < ApplicationController
  def create
    @hikingparticipation = current_user.hikingparticipations.build(params[:hikingparticipation])
    @hiking = @hikingparticipation.hiking
    if @hikingparticipation.save
      if current_user.facebook_uid and current_user.facebook_connect
        @graph.put_wall_post("정상등반을 준비중입니다. 함꼐가요!! with 망고마운틴", {
          :name => @hiking.name, 
          :picture => request.protocol + request.host + @hiking.hikingphoto.url,
          :link => request.protocol + request.host + hiking_path(@hiking),
          :caption => @hikingparticipation.user.korean_full_name,
          :description => "#{@hiking.datetime.strftime("%Y년 %m월 %d일 %H시 %M분 출발")}-#{@hiking.location}" })
      end
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
