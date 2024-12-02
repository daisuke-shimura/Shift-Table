class JobsController < ApplicationController

  def new
    @job = Job.new
    @day = Day.find(params[:day_id])
    @user = User.all
    @job_comment = JobComment.where(day_id: @day.id)
  end

  def create
    job = Job.new(job_params)
    day = Day.find(params[:day_id])
    job.day_id = day.id
    job.user_id = current_user.id
    job.save
    flash[:create_message] = "提出しました。"
    redirect_to request.referer
  end

  def edit
    @job = Job.find(params[:id])
    @day = Day.find(params[:day_id])
    @user = User.all
    @job_comment = JobComment.where(day_id: @day.id)
  end

  def update
    job = Job.find(params[:id])
    day = Day.find(params[:day_id])
    job.update(job_params)
    redirect_to new_day_job_path(day.id)
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy
    redirect_to request.referer
  end


  private
  def job_params
    params.require(:job).permit(:time1,:time2,:time3,:time4,:time5,:time6,:time7)
  end

end