class UserSerializer < ActiveModel::Serializer
    attributes :name, :uname, :id, :photo, :api_token
end
