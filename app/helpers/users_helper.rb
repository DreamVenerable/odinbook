module UsersHelper
  def following?(user)
    Fellowship.where(follower_id: current_user.id, followee_id: user.id).exists?
  end
end
