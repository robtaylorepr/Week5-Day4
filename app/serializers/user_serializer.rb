class UserSerializer < ActiveModel::Serializer
  attributes :name, :uname, :id, :photo, :follow

  def follow
    # is uname following current)user
  end

end
