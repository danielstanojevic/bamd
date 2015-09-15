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

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.update_attribute(:confirmed, true)
    Friendship.create(from_id: @friendship.to_id, to_id: @friendship.from_id, confirmed: true)
    redirect_to current_user
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end
end
