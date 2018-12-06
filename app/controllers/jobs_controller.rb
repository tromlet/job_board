class JobsController < ApplicationController
  before_action :set_job, only: [:destroy, :edit, :update, :show]
  before_action :set_job_with_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
  has_scope :search

  def index
    @jobs = apply_scopes(Job).page(params[:page])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    # @job.title = params[:job][:title]
    # @job.description = params[:job][:description]
    @job.user = current_user

    if @job.save
      redirect_to jobs_path
    else
      flash.now[:notice] = "We failed to create your job.  Sorry!"
      render 'new'
    end
  end

  def destroy
    @job.destroy
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render 'edit'
    end
  end

  def show
  end

  private
    def set_job
      @job = Job.find(params[:id])
    end

    def set_job_with_user
      @job = current_user.jobs.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title, :description)
    end



end
