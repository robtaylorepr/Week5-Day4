# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do
  @aname = Faker::Name,
  Faker.unique_mode = true
  @auname = Faker::Internet.user_name
  Faker.unique_mode = false
  @apassword = Faker::Internet.password
  @user = User.create(
    name:     @aname,
    uname:    @auname,
    password: @apassword
  )
  2.times do
    Post.create(
      body: Faker::TwinPeaks.quote,
      user: @user
    )
  end
end
