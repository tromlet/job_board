class ResumesController < ApplicationController
  layout false

  def show
    # @user, in order to pinpoint WHICH resume to display on a user's profile
    @user = User.find(params[:id])
    # @resume, which defines the direct path to the PDF for PDF.JS to display it inline
    @resume = rails_blob_path(@user.resume, only_path: true)
  end
end
