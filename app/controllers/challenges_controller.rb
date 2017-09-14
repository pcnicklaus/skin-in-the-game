class ChallengesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_challenge, only: [:show, :edit, :update, :destroy, :challenger]
  before_action :owned_challenge, only: [:destroy]

  def index
    # @challenges = Challenge.all
    # @challenges = Kaminari.paginate_array(@challenges).page(params[:page]).per(5)
    @challenges = Challenge.all.order('created_at DESC').page params[:page]
  end

  def show
  end

  def new
    @challenge = current_user.challenges.build
  end

  def challenger
  end


  def create
    @challenge = current_user.challenges.build(challenge_params)

    if @challenge.save
      flash[:success] = "Your challenge has been created"
      redirect_to root_path
    else

      flash[:alert] = "Something went wrong?!? Check your form yo'!"
      render :new
    end
  end

  def edit
  end


  def update

    if @challenge.update(challenge_params)
        ChallengeMailer.challenge_email(@challenge).deliver_now
        flash[:success] = "Post updated."
        redirect_to root_path
      else
        flash[:alert] = "Update failed.  Please check the form."
        render :edit
      end

  end

  def destroy
    @challenge.destroy
    redirct_to root_path
  end

  private

  def challenge_params
    params.require(:challenge).permit(:image, :title, :description, :criteria, :challenger_id)
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
