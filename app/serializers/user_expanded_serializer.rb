class UserExpandedSerializer < ActiveModel::Serializer
  attributes :name, :uname, :id, :photo, :api_token

  def followstatus
    if current_user
      current_user.follows?(object)
    else
      false
    end
  end
end
