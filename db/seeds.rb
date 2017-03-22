# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do
  @user = User.create(
    name:     Faker::Name.name,
    uname:    Faker::Internet.user_name,
    password: Faker::Internet.password
  )
  2.times do
    Post.create(
      body: Faker::TwinPeaks.quote,
      user: @user
    )
  end
end
