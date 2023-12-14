module PostsHelper
  def liked?(post)
    post.likes.exists?(user_id: current_user.id)
  end
end
