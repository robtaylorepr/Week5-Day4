class UserSerializer < ActiveModel::Serializer
  attributes :name, :uname, :id, :photo, :follow

  def follow
    if current_user
      current_user.follows?(object)
    else
      false
    end
  end

end
