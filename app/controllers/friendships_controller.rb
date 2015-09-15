class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:to_id => params[:to_id])
    if @friendship.save
      flash[:notice] = "Sent friend request."
      redirect_to current_user
    else
      flash[:error] = "Unable to add friend."
      redirect_to current_user
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end
end
