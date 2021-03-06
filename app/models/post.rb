class Post < ApplicationRecord
  belongs_to	:user
  validates :body,  presence: true
  validates_length_of :body, :maximum => 160
  # paginates_per 5

  def self.timeline(user)
    following_ids = user.followees(User).pluck(:id)
    all_ids= following_ids << user.id
    Post.where(user_id: all_ids).order("created_at DESC")
  end

end
