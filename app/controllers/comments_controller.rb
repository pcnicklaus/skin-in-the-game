class CommentsController < ApplicationController

  before_action :set_challenge

  def destroy
    @comment = @challenge.comments.find(params[:id])

    if @comment.user_id == current_user.id
     @comment.delete
     respond_to do |format|
       format.html { redirect_to root_path }
       format.js
     end
   end
  end

  def create
    @comment = @challenge.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "You commented the hell out of that challenge!"
      respond_to do |format|
       format.html { redirect_to root_path }
       format.js
      end
    else
      flash[:alert] = "Check the comment form, something went horribly wrong."
      render root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

end
