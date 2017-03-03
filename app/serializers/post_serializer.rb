class PostSerializer < ActiveModel::Serializer
  attributes :body, :user_id
end
