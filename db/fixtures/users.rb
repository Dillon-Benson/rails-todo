500.times do
  User.seed do |s|
    s.email = Faker::Internet.email
    s.password = "<abc123>"
  end
end
