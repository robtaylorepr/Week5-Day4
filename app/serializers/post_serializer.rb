class PostSerializer < ActiveModel::Serializer
  attributes :body, :user_id
  belongs_to :user, serializer: UserExpandedSerializer
end
