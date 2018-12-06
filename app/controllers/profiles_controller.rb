class ProfilesController < ApplicationController
  before_action :your_profile, only: [:edit, :update]

  def index
    # 
    @profiles = User.page(params[:page])
  end

  def show
    @profile = specify_profile
    @jobs = @profile.jobs.page(params[:page])
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    @profile.resume.attach(params[:user][:resume])
    redirect_to profile_path
  end

  private
    def profile_params
      params.require(:user).permit(:firstname, :lastname, :description)
    end

    def specify_profile
      @profile = User.find(params[:id])
    end

    def your_profile
      @profile = current_user
    end
end
