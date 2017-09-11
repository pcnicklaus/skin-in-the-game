class ChallengesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  before_action :owned_challenge, only: [:edit, :update, :destroy]

  def index
    @challenges = Challenge.all
  end

  def show
  end

  def new
    @challenge = current_user.challenges.build
  end

  

  def create

    @challenge = current_user.challenges.build(challenge_params)

    if @challenge.save
      flash[:success] = "Your challenge has been created"
      redirect_to challenges_path
    else
      flash[:alert] = "Something went wrong?!? Check your form yo'!"
      render :new
    end
  end

  def edit
  end

  def update
    if @challenge.update(challenge_params)
      flash[:success] = "Oh yeah, that update feels nice... :)"
      redirect_to challenges_path
    else
      flash[:alert] = "Update suffered catastrophic failure?!? Check your form yo'!"
      render :edit
    end

  end

  def destroy
    @challenge.destroy
    redirct_to root_path
  end

  private

  def challenge_params
    params.require(:challenge).permit(:image, :title)
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  def owned_challenge
    unless current_user == @challenge.user
      flash[:alert] = "That challenge doesn't belong to you!"
      redirect_to root_path
    end
  end

end
