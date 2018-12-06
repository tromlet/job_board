class ApplicantsController < ApplicationController
  before_action :authenticate_user!

  def create
    @job = Job.find(params[:job_id])
    unless @job.user.id == current_user.id
      if current_user.resume.attached?
        unless @job.candidates.exists? current_user.id
          @job.candidates << current_user
          redirect_to job_path(@job), notice: "You have submitted your application!"
        else
          redirect_to job_path(@job), alert: "You've already applied to this position."
        end
      else
        flash[:error] = "You need to upload a resume."
        redirect_to job_path(@job)
      end
    else
      redirect_to job_path(@job), notice: "You cannot apply for your own jobs"
    end
  end

end
