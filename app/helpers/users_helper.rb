module UsersHelper
  def accepted?(user1, user2)
    Fellowship.find_by(follower_id: user2.id, followee_id: user1.id, status: 'accepted').present?
  end

  def onhold?(user1, user2)
    Fellowship.find_by(follower_id: user2.id, followee_id: user1.id, status: 'onhold').present?
  end
end
