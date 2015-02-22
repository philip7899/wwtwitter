class ProfilesController < ApplicationController
  
  before_action :authenticate_user!

  def new
  	@profile = Profile.new
  end

  def create
  	@profile = Profile.new(profile_params)
  	@profile.user = current_user

  	if @profile.save
  		flash[:success] = "You have created a profile"
  		redirect_to new_tweet_path
  	else
  		render 'new'
  	end
  end

  def show
  	@profile = Profile.where(name: params[:id]).first
  end

  private

  def profile_params
  	params.require(:profile).permit(:name, :picture, :bio)
  end

end
